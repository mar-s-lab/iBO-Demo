import { useState, useRef, useEffect, useCallback } from 'react'

/* ── System prompt para DeepSeek ─────────────────── */
const SYSTEM_PROMPT = `Eres Aguapanela, un asistente conversacional cálido y cercano del IDPYBA (Instituto Distrital de Protección y Bienestar Animal) en Bogotá.

Tu misión: guiar a dueños de mascotas en el proceso de esterilización gratuita, desde el agendamiento hasta el cuidado post-operatorio.

PERSONALIDAD:
- Cálida, empática y cercana. Hablas como una amiga que sabe mucho de animales.
- Usas emojis con moderación 🐾💛
- Mensajes cortos y directos. Máximo 3-4 líneas por respuesta.
- Nunca das información técnica veterinaria compleja.
- Nunca inventas fechas, turnos o citas reales.

DATOS CLAVE DEL IDPYBA:
- Teléfono: +57 (601) 647 71 17 (L-V 8am-5pm)
- Emergencias: 123 (24h)
- Email: proteccionanimal@animalesbog.gov.co
- Sedes: Sede Admin (Cra 10 #26-51), UCA Engativá (Cra 106A #67-02), SuperCADE Manitas, Américas, Suba, CAD
- Esterilización gratuita para estratos 0-3, animales de calle, fundaciones

CANCELACIONES:
- Solo hasta 1 día hábil antes (festivos no cuentan).
- Si está en plazo: confirmar antes de cancelar.
- Si ya pasó el plazo: indicar que no es posible y dirigir a un punto de atención.

Termina siempre ofreciendo una siguiente acción concreta.`

/* ── Flujos predefinidos ─────────────────────────── */
const FLOWS = {
  welcome: [
    {
      role: 'assistant', type: 'text',
      content: '¡Hola! Soy **Aguapanela** 🐾\n¿Qué quieres hacer hoy?',
      actions: [
        { label: '🗓️ Agendar una cita',      value: 'Quiero agendar una cita de esterilización' },
        { label: '❌ Cancelar mi cita',        value: 'Necesito cancelar mi cita' },
        { label: '📋 Ver requisitos',          value: '¿Qué necesito llevar?' },
        { label: '💊 Cuidados después de la cirugía', value: '¿Cómo cuido a mi mascota después de la cirugía?' },
        { label: '📍 Ver puntos de atención',  value: '¿Dónde quedan los puntos de atención?' },
      ],
    },
  ],

  agendar: [
    {
      role: 'assistant', type: 'card',
      title: '🗓️ Cómo agendar tu cita',
      intro: 'Tienes tres formas de hacerlo:',
      items: [
        '💻 En línea — sistema de turnos en animalesbog.gov.co',
        '🏢 Presencial — SuperCADE Manitas, Américas, Suba o CAD',
        '📞 Teléfono — +57 (601) 647 71 17 · L-V 8am–5pm',
      ],
      note: 'Máximo 2 citas por ciudadano. Solo para mayores de edad.',
      actions: [
        { label: '📋 ¿Qué necesito llevar?',         value: '¿Qué documentos necesito?' },
        { label: '🐕 ¿Quién puede acceder?',          value: '¿Quién puede acceder al servicio?' },
        { label: '📍 Ver puntos de atención',         value: '¿Dónde quedan los puntos de atención?' },
      ],
    },
  ],

  requisitos: [
    {
      role: 'assistant', type: 'checklist',
      title: '📋 Lo que debes llevar',
      intro: 'Alístate con estos documentos:',
      checks: [
        '📱 Código QR de confirmación',
        '🪪 Documento de identidad (original)',
        '📄 Fotocopia de cédula',
        '💡 Fotocopia de recibo de servicios públicos',
        '🦺 Collar isabelino para tu mascota',
        '🧣 Manta o cobija',
        '🐕 Correa y traílla · o · 🐈 Guacal seguro',
      ],
      note: '⏰ Ayuno: 8h sin comida sólida · 2h sin agua',
      actions: [
        { label: '✅ Ya tengo todo',           value: 'Ya tengo todos los documentos y estoy lista/o' },
        { label: '🗓️ ¿Cómo agendo?',          value: '¿Cómo agendo la cita?' },
        { label: '💊 Cuidados post-op',        value: '¿Cómo cuido a mi mascota después?' },
      ],
    },
  ],

  postop: [
    {
      role: 'assistant', type: 'checklist',
      title: '💊 Cuidados después de la cirugía',
      intro: 'Para una recuperación tranquila:',
      checks: [
        '🏠 Reposo los primeros 3–5 días',
        '🦺 Collar isabelino puesto todo el tiempo',
        '💧 Agua fresca siempre disponible',
        '🍽️ Comida blanda las primeras 24 horas',
        '🛏️ Cama limpia, cálida y sin humedad',
        '👀 Revisa la herida a diario',
      ],
      alerts: [
        'Sangrado abundante o que no para',
        'Inflamación fuerte o con mal olor',
        'Fiebre o decaimiento extremo',
        'No come ni bebe agua por más de 24h',
      ],
      actions: [
        { label: '✅ Entendido, gracias',      value: 'Entendido, ya sé cómo cuidarla' },
        { label: '🚨 Tengo una emergencia',    value: 'Mi mascota tiene una emergencia ahora' },
        { label: '❓ Tengo otra pregunta',     value: 'Tengo una pregunta diferente' },
      ],
    },
  ],

  cancelar: [
    {
      role: 'assistant', type: 'card',
      title: '❌ Cancelar tu cita',
      intro: 'Antes de continuar necesito saber:',
      items: [
        '📅 ¿Cuándo es tu cita (fecha)?',
        '🐾 ¿Cuál es el nombre de tu mascota?',
      ],
      note: '⚠️ Solo puedes cancelar hasta 1 día hábil antes. Los festivos no cuentan.',
      actions: [
        { label: 'Mi cita es mañana o después',  value: 'Mi cita es mañana o en los próximos días' },
        { label: 'Mi cita es hoy',                value: 'Mi cita es hoy mismo' },
      ],
    },
  ],

  sedes: [
    {
      role: 'assistant', type: 'card',
      title: '📍 Puntos de atención',
      intro: 'El IDPYBA te atiende en:',
      items: [
        '🏢 Sede principal · Cra 10 #26-51 Tequendama P5 · L-V 8am–5pm',
        '🐾 UCA Engativá · Cra 106A #67-02 · Mar–Dom 10am–3pm',
        '🏪 SuperCADE Manitas · Cra 18L #70B-50 Sur · L-V 7am–4:30pm',
        '🏪 SuperCADE Américas · Av Cra 86 #43-55 Sur · L-V 7am–4:30pm',
        '🏪 SuperCADE Suba · Clle 145 #103B-90 · L-V 7am–4:30pm',
        '🏪 SuperCADE CAD · Cra 30 #25-90 · L-V 7am–4:30pm',
      ],
      note: '📞 +57 (601) 647 71 17 · 🚨 Emergencias: 123',
      actions: [
        { label: '🗓️ Agendar cita',       value: 'Quiero agendar una cita' },
        { label: '📋 Ver requisitos',      value: '¿Qué necesito llevar?' },
      ],
    },
  ],

  ready: [
    {
      role: 'assistant', type: 'success',
      icon: '🎉',
      content: '¡Todo listo!\n\nTu mascota está en las mejores manos. Si tienes alguna duda antes o después de la cita, aquí estaré 🐾',
      actions: [
        { label: '💊 Ver cuidados post-op',     value: '¿Cómo cuido a mi mascota después?' },
        { label: '⏰ ¿Cuánto tiempo de ayuno?', value: '¿Cuánto tiempo de ayuno necesita mi mascota?' },
        { label: '👋 ¡Hasta luego!',            value: 'Gracias, hasta luego' },
      ],
    },
  ],

  emergency: [
    {
      role: 'assistant', type: 'danger',
      title: '🚨 Emergencia animal',
      intro: 'Contacta de inmediato:',
      items: [
        '📞 Línea de emergencias: 123 (24 horas)',
        '📞 IDPYBA: +57 (601) 647 71 17',
        '📧 proteccionanimal@animalesbog.gov.co',
      ],
      note: 'Si el animal está en peligro inminente, llama al 123 ahora.',
      actions: [
        { label: '✅ Gracias, ya llamé',    value: 'Gracias, ya llamé al 123' },
        { label: '❓ Otra pregunta',        value: '¿Qué más puedes ayudarme?' },
      ],
    },
  ],

  adios: [
    {
      role: 'assistant', type: 'success',
      icon: '🐾',
      content: '¡Hasta pronto! Cuida mucho a tu peludito.\n\nSi necesitas algo, aquí estaré 💛',
      actions: [
        { label: '↩️ Volver al inicio',    value: '__welcome__' },
      ],
    },
  ],
}

/* ── Detección de intención ──────────────────────── */
function detectIntent(text) {
  const t = text.toLowerCase()
  if (t === '__welcome__') return 'welcome'
  if (/agend|cita|turno|program|reserv/.test(t))           return 'agendar'
  if (/cancel/.test(t))                                      return 'cancelar'
  if (/requisit|document|llev|necesit|traer|prepar/.test(t)) return 'requisitos'
  if (/post.?op|después|despues|cirugía|cirugia|recuper|cuidado/.test(t)) return 'postop'
  if (/sede|dónde|donde|direcci|ubic|punto/.test(t))         return 'sedes'
  if (/listo|tengo todo|gracias.*listo|estoy list/.test(t))  return 'ready'
  if (/emergencia|urgente|herida|sangr|grave|peligro/.test(t)) return 'emergency'
  if (/adiós|adios|hasta luego|hasta pronto|chao/.test(t))   return 'adios'
  return null
}

/* ── Renderizado de mensajes ─────────────────────── */
function BotMessage({ msg, isLast, onAction, disabled }) {
  const content = (() => {
    switch (msg.type) {
      case 'text':
        return (
          <div className="bubble-text" dangerouslySetInnerHTML={{
            __html: msg.content
              .replace(/\*\*(.*?)\*\*/g, '<strong>$1</strong>')
              .replace(/\n/g, '<br/>')
          }} />
        )

      case 'card':
      case 'danger':
        return (
          <div className={`bubble-card ${msg.type === 'danger' ? 'danger' : ''}`}>
            {msg.title && <div className="card-title">{msg.title}</div>}
            {msg.intro && <div className="card-intro">{msg.intro}</div>}
            {msg.items?.length > 0 && (
              <ul className="card-items">
                {msg.items.map((item, i) => (
                  <li key={i} className="card-item">{item}</li>
                ))}
              </ul>
            )}
            {msg.note && <div className="card-note">{msg.note}</div>}
          </div>
        )

      case 'checklist':
        return (
          <div className="bubble-card">
            {msg.title && <div className="card-title">{msg.title}</div>}
            {msg.intro && <div className="card-intro">{msg.intro}</div>}
            {msg.checks?.length > 0 && (
              <ul className="check-list">
                {msg.checks.map((item, i) => (
                  <li key={i} className="check-item">
                    <span className="check-icon">✓</span>
                    <span>{item}</span>
                  </li>
                ))}
              </ul>
            )}
            {msg.alerts?.length > 0 && (
              <div className="alert-section">
                <div className="alert-title">⚠️ Consulta al veterinario si notas:</div>
                {msg.alerts.map((a, i) => (
                  <div key={i} className="alert-item">
                    <span className="alert-dot" />
                    <span>{a}</span>
                  </div>
                ))}
              </div>
            )}
            {msg.note && <div className="card-note">{msg.note}</div>}
          </div>
        )

      case 'success':
        return (
          <div className="bubble-success">
            {msg.icon && <div className="success-icon">{msg.icon}</div>}
            <div className="success-text">{msg.content}</div>
          </div>
        )

      default:
        return <div className="bubble-text">{msg.content}</div>
    }
  })()

  return (
    <div className="msg-row bot">
      {content}
      {isLast && msg.actions?.length > 0 && (
        <div className="quick-replies">
          {msg.actions.map((a) => (
            <button
              key={a.label}
              className="qr-btn"
              onClick={() => onAction(a.value)}
              disabled={disabled}
            >
              {a.label}
            </button>
          ))}
        </div>
      )}
    </div>
  )
}

function UserMessage({ content }) {
  return (
    <div className="msg-row user">
      <div className="bubble-text">{content}</div>
    </div>
  )
}

/* ── Componente principal ────────────────────────── */
export default function Chat() {
  const [messages, setMessages] = useState(FLOWS.welcome)
  const [input,    setInput]    = useState('')
  const [loading,  setLoading]  = useState(false)
  const endRef = useRef(null)

  useEffect(() => {
    endRef.current?.scrollIntoView({ behavior: 'smooth' })
  }, [messages, loading])

  const addMessages = useCallback((msgs) => {
    setMessages(prev => [...prev, ...msgs])
  }, [])

  const handleSend = useCallback(async (text) => {
    const trimmed = text.trim()
    if (!trimmed || loading) return

    /* Mensaje del usuario */
    const userMsg = { role: 'user', type: 'text', content: trimmed }
    setMessages(prev => [...prev, userMsg])
    setInput('')
    setLoading(true)

    /* Flujo predefinido */
    const intent = detectIntent(trimmed)
    if (intent && FLOWS[intent]) {
      await new Promise(r => setTimeout(r, 600))
      addMessages(FLOWS[intent])
      setLoading(false)
      return
    }

    /* Fallback: DeepSeek API */
    const apiKey = import.meta.env.VITE_DEEPSEEK_API_KEY
    if (!apiKey) {
      await new Promise(r => setTimeout(r, 500))
      addMessages([{
        role: 'assistant', type: 'text',
        content: 'Hmm, no entendí bien tu pregunta 🐾\n¿Puedes elegir una de las opciones o escribir de otra forma?',
        actions: [
          { label: '🗓️ Agendar cita',    value: 'Quiero agendar una cita' },
          { label: '📋 Requisitos',       value: '¿Qué necesito llevar?' },
          { label: '💊 Cuidados post-op', value: '¿Cómo cuido a mi mascota después?' },
          { label: '📍 Ver sedes',        value: '¿Dónde quedan los puntos de atención?' },
        ],
      }])
      setLoading(false)
      return
    }

    try {
      /* Historial para la API (solo text, sin acciones) */
      const history = messages
        .filter(m => m.role === 'user' || (m.role === 'assistant' && m.content))
        .map(m => ({
          role: m.role,
          content: typeof m.content === 'string' ? m.content
            : [m.title, m.intro, ...(m.items ?? []), ...(m.checks ?? [])].filter(Boolean).join('\n'),
        }))
      history.push({ role: 'user', content: trimmed })

      const res  = await fetch('https://api.deepseek.com/chat/completions', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json', 'Authorization': `Bearer ${apiKey}` },
        body: JSON.stringify({ model: 'deepseek-chat', max_tokens: 512,
          messages: [{ role: 'system', content: SYSTEM_PROMPT }, ...history] }),
      })
      const data = await res.json()
      const reply = data.choices?.[0]?.message?.content ?? 'No obtuve respuesta. Intenta de nuevo.'
      addMessages([{
        role: 'assistant', type: 'text', content: reply,
        actions: [
          { label: '🗓️ Agendar cita',    value: 'Quiero agendar una cita' },
          { label: '📋 Requisitos',       value: '¿Qué necesito llevar?' },
          { label: '💊 Cuidados post-op', value: '¿Cómo cuido a mi mascota después?' },
        ],
      }])
    } catch {
      addMessages([{
        role: 'assistant', type: 'text',
        content: 'Tuve un problema para conectarme 😔\nLlámanos al +57 (601) 647 71 17 y te ayudamos enseguida.',
        actions: [{ label: '🚨 Ver emergencias', value: 'Mi mascota tiene una emergencia' }],
      }])
    } finally {
      setLoading(false)
    }
  }, [messages, loading, addMessages])

  const lastBotIdx = (() => {
    for (let i = messages.length - 1; i >= 0; i--) {
      if (messages[i].role === 'assistant') return i
    }
    return -1
  })()

  return (
    <div className="chat-wrap">
      <div className="messages">
        {messages.map((msg, i) =>
          msg.role === 'user'
            ? <UserMessage key={i} content={msg.content} />
            : <BotMessage
                key={i}
                msg={msg}
                isLast={i === lastBotIdx}
                onAction={handleSend}
                disabled={loading}
              />
        )}
        {loading && (
          <div className="msg-row bot">
            <div className="bubble-typing">
              <span /><span /><span />
            </div>
          </div>
        )}
        <div ref={endRef} />
      </div>

      <form
        className="input-bar"
        onSubmit={e => { e.preventDefault(); handleSend(input) }}
      >
        <input
          className="chat-input"
          value={input}
          onChange={e => setInput(e.target.value)}
          placeholder="Escríbeme lo que necesitas..."
          disabled={loading}
          autoFocus
        />
        <button
          className="send-btn"
          type="submit"
          disabled={!input.trim() || loading}
          title="Enviar"
        >
          ➤
        </button>
      </form>
    </div>
  )
}
