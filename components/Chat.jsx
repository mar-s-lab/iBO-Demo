import { useState, useRef, useEffect } from 'react'

const SYSTEM_PROMPT = `Eres un asistente conversacional del Instituto Distrital de Protección y Bienestar Animal (IDPYBA) en Bogotá.

Tu objetivo es guiar a los ciudadanos en todo el proceso de esterilización de sus mascotas, desde el agendamiento hasta el seguimiento postoperatorio.

PRINCIPIOS:
- Sé claro, cercano y confiable
- Usa lenguaje simple, sin tecnicismos
- Responde con mensajes cortos y estructurados
- Usa emojis moderadamente 🐾💛
- Prioriza instrucciones accionables (checklists, pasos)
- Valida cada paso antes de avanzar
- Si el usuario comete errores, guía sin generar frustración

PROCESO - 3 ETAPAS:
1. PRE (antes de la cita): agendamiento, requisitos, preparación
2. EN JORNADA (durante): recepción, procedimiento, recuperación
3. POST (después): cuidados, alertas médicas, seguimiento

REGLA CRÍTICA - CANCELACIÓN:
- Solo se puede cancelar hasta 1 día hábil antes (festivos no cuentan)
- El usuario puede cancelar TODO el día límite (hasta las 11:59 pm)
- Si está fuera del plazo: NO se permite cancelar

RESPUESTAS DE CANCELACIÓN:
Si PUEDE cancelar, siempre preguntar primero:
"¿Confirmamos la cancelación de la cita de [nombre mascota] 🐾 📅 [fecha]?"
Luego si confirma:
"✅ Tu cita fue cancelada con éxito. Si lo necesitas, puedo ayudarte a agendar una nueva 🐾"

Si NO puede cancelar:
"⚠️ Ya no es posible cancelar esta cita. Las cancelaciones deben hacerse con al menos 1 día hábil de anticipación 📅. Si necesitas ayuda, puedes acercarte al punto de atención 💬"

ETAPA PRE - checklist estándar:
"Antes de la cirugía recuerda:
• Ayuno de 8 horas 🍽️❌
• Agua hasta 2 horas antes 💧
• Llevar transportador 🧺
• Collar isabelino
• Fotocopia de cédula y recibo de servicios
• Código QR de confirmación"

ETAPA EN JORNADA - mensajes:
Recepción: "Hola 👋 ya registramos tu llegada con [mascota] 🐾"
En procedimiento: "Tu mascota está en procedimiento 🏥 Todo está bajo control, te avisaré cuando finalice 💛"
Finalización: "Hemos terminado el procedimiento, tu mascota está en recuperación 🐾"

ETAPA POST - alertas obligatorias:
"⚠️ Consulta de inmediato si notas:
• Sangrado abundante
• Inflamación fuerte
• Decaimiento extremo"
Seguimiento: "¿Cómo sigue [nombre mascota] hoy? 🐾"

VALIDACIÓN DE DOCUMENTOS:
Si está bien: "✅ ¡Perfecto! La información se ve clara"
Si está mal: "⚠️ No logro ver bien la información. ¿Puedes intentar nuevamente con mejor luz y sin movimiento?"

CONFIRMACIONES: Antes de cualquier acción crítica (cancelar, agendar) preguntar: "¿Confirmamos esta acción?"

ESCALAMIENTO: "Si prefieres, puedo conectarte con un asesor 💬 Línea: +57 (601) 647 71 17"

RESTRICCIONES:
- No inventes fechas específicas si no las tienes
- No confirmes acciones sin validación del usuario
- No uses lenguaje técnico veterinario complejo
- No des diagnósticos médicos
- Solo atiendes animales de Bogotá, estratos 0-3 o en situación de calle

DATOS ÚTILES:
- Teléfono IDPYBA: +57 (601) 647 71 17 (L-V 8am-5pm)
- Emergencias: 123 (24h)
- Email: proteccionanimal@animalesbog.gov.co
- Sedes: Sede Admin (Cra 10 #26-51), UCA Engativá (Cra 106A #67-02), SuperCADE Manitas, Américas, Suba, CAD`

const DEMO_RESPONSES = {
  agendar: '📅 ¡Claro! Para agendar una cita de esterilización necesito estos datos:\n• Nombre y edad de tu mascota 🐾\n• Tu teléfono de contacto 📱\n• Dirección y estrato en Bogotá 📍\n• ¿Tu mascota es gato o perro?\n\nCon esta información te confirmo disponibilidad. ¿Me das esos datos?',
  cancelar: '❌ Entendido. Para cancelar tu cita necesito:\n• Fecha de tu cita actual 📅\n• Nombre de tu mascota 🐾\n\nRecuerda que solo puedes cancelar hasta 1 día hábil antes. ¿Confirmamos la cancelación?',
  requisitos: '📋 Antes de la cirugía lleva estos documentos y cosas:\n\n📄 DOCUMENTOS:\n• Fotocopia de cédula del dueño\n• Recibo de servicios públicos (comprobante de domicilio)\n• Código QR de confirmación de cita\n\n🛠️ ELEMENTOS:\n• Transportador seguro para tu mascota 🧺\n• Collar isabelino (nosotros te lo proporcionamos)\n• Manta o cobija para el regreso\n\n🍽️ AYUNO IMPORTANTE:\n• 8 horas sin comida\n• Solo agua hasta 2 horas antes',
  cuidados: '💊 Después de la cirugía, los cuidados son CRÍTICOS:\n\n✅ REPOSO Y MOVIMIENTO:\n• Reposo total por 7-10 días\n• Evita que salte o corra\n• Sin baños durante 2-3 semanas\n\n🍗 ALIMENTACIÓN:\n• Alimento blando los primeros 3-5 días\n• Agua fresca siempre disponible\n• Vuelve a comida normal gradualmente\n\n🦴 CUIDADO DE LA HERIDA:\n• Collar isabelino 10-14 días\n• No lamer ni morder la herida\n• Revisa diariamente si hay enrojecimiento\n\n⚠️ LLAMA AL 123 URGENTE SI:\n• Sangrado abundante 🩸\n• Inflamación fuerte o pus\n• Decaimiento extremo\n• Fiebre o vómito',
  sedes: '📍 Nuestros puntos de atención en Bogotá:\n\n🏢 SEDE ADMINISTRATIVA:\nCarrera 10 #26-51\nHorario: L-V 8am-5pm\n\n🏥 UCA ENGATIVÁ:\nCarrera 106A #67-02\nDonde hacemos los procedimientos\n\n🏛️ SUPERCADE:\n• Manitas\n• Américas\n• Suba\nInformación y registro\n\n📞 CONTACTO GENERAL:\nTeléfono: +57 (601) 647 71 17\n⏰ Horario: Lunes a Viernes 8am-5pm\n🚨 Emergencias: 123 (24 horas)',
  horario: '⏰ HORARIOS DE ATENCIÓN:\n\n📅 LUNES A VIERNES:\n• 8:00 am - 5:00 pm\n\n🎉 FESTIVOS:\n• Atención limitada\n• Emergencias: 123\n\n📱 CONTACTOS:\n• Línea general: +57 (601) 647 71 17\n• WhatsApp: +57 (601) 647 71 17 (consultas rápidas)',
  emergencia: '🚨 ¡EMERGENCIA VETERINARIA!\n\n📞 LLAMA INMEDIATAMENTE AL 123\n\nEs importante que tu mascota reciba atención urgente si tiene:\n• Sangrado no controlable\n• Dificultad para respirar\n• Inconsciencia o convulsiones\n• Dolor extremo\n\nSi es fuera de horario IDPYBA, ve a la clínica veterinaria más cercana. Luego nos contactas.',
  precio: '💰 INFORMACIÓN DE COSTOS:\n\nEl costo de la esterilización depende de:\n• Tipo de mascota (perro/gato)\n• Peso del animal\n• Edad y condición de salud\n\n📞 Para presupuesto exacto:\nLlama: +57 (601) 647 71 17\nEmail: proteccionanimal@animalesbog.gov.co\n\n✅ Ofrecemos planes para estratos 0-3 y mascotas en situación de calle.',
  perro: '🐕 ESTERILIZACIÓN DE PERROS:\n\n✓ Procedimiento seguro y rápido\n✓ Tiempo de recuperación: 10-14 días\n✓ Beneficios:\n  • Previene cáncer de mama\n  • Evita camadas no planeadas\n  • Disminuye comportamientos agresivos\n\n📞 Para agendar cita de tu perro:\nLlama al +57 (601) 647 71 17\n\n¿Tiene años? ¿Cuál es su peso aproximado?',
  gato: '🐈 ESTERILIZACIÓN DE GATOS:\n\n✓ Procedimiento minimamente invasivo\n✓ Tiempo de recuperación: 7-10 días\n✓ Beneficios:\n  • Cero comportamientos de celo\n  • Previene enfermedades reproductivas\n  • Aumenta lifespan\n\n📞 Para agendar cita de tu gato:\nLlama al +57 (601) 647 71 17\n\n¿Cuántos años tiene? ¿Peso aproximado?',
  recuperacion: '🏥 PROCESO DE RECUPERACIÓN PASO A PASO:\n\nDÍAS 1-3:\n• Reposo absoluto\n• Medicamentos cada 8 horas (si aplica)\n• Revisión de la herida\n\nDÍAS 4-7:\n• Movimiento muy limitado\n• Paseos cortos solo para necesidades\n• Sigue con collar isabelino\n\nDÍAS 8-14:\n• Aumenta actividad gradualmente\n• Retira collar isabelino si está bien\n• Última revisión con veterinario\n\n⚠️ Cualquier problema, llama inmediatamente.',
  default: '¡Hola! 👋 Soy el asistente del IDPYBA. Puedo ayudarte con:\n• 📅 Agendar una cita\n• ❌ Cancelar una cita\n• 📋 Requisitos y documentos\n• 💊 Cuidados post-operatorios\n• 🐕 Esterilización de perros\n• 🐈 Esterilización de gatos\n• 📍 Ubicación de sedes\n• ⏰ Horarios de atención\n• 🚨 Emergencias\n\n¿Con cuál te puedo ayudar?'
}

// Función para calcular similitud entre strings (detectar typos)
const levenshteinDistance = (a, b) => {
  const matrix = []
  for (let i = 0; i <= b.length; i++) matrix[i] = [i]
  for (let j = 0; j <= a.length; j++) matrix[0][j] = j
  for (let i = 1; i <= b.length; i++) {
    for (let j = 1; j <= a.length; j++) {
      if (b.charAt(i - 1) === a.charAt(j - 1)) matrix[i][j] = matrix[i - 1][j - 1]
      else matrix[i][j] = Math.min(matrix[i - 1][j - 1] + 1, matrix[i][j - 1] + 1, matrix[i - 1][j] + 1)
    }
  }
  return matrix[b.length][a.length]
}

// Función para buscar palabras clave tolerando errores
const findKeyword = (text, keywords) => {
  const lower = text.toLowerCase()
  for (const keyword of keywords) {
    // Búsqueda exacta primero
    if (lower.includes(keyword)) return true
    // Búsqueda con tolerancia a typos
    const words = lower.split(/\s+/)
    for (const word of words) {
      const distance = levenshteinDistance(keyword, word)
      // Si la distancia es menor que 2, considera que es similar
      if (distance <= 2 && keyword.length > 3) return true
    }
  }
  return false
}

const getDemoResponse = (message) => {
  // Palabras clave por categoría (ahora más flexibles)
  if (findKeyword(message, ['agendar', 'cita', 'programar', 'reservar', 'horario disponible'])) return DEMO_RESPONSES.agendar
  if (findKeyword(message, ['cancelar', 'annular', 'borrar', 'eliminar cita'])) return DEMO_RESPONSES.cancelar
  if (findKeyword(message, ['requisito', 'documento', 'llevar', 'necesito', 'qué traer', 'que llevar'])) return DEMO_RESPONSES.requisitos
  if (findKeyword(message, ['cuidado', 'post', 'después', 'recuperación', 'herida', 'recuperar'])) return DEMO_RESPONSES.cuidados
  if (findKeyword(message, ['sede', 'donde', 'ubicación', 'dirección', 'punto atencion'])) return DEMO_RESPONSES.sedes
  if (findKeyword(message, ['horario', 'hora', 'abierto', 'atiende', 'cuando'])) return DEMO_RESPONSES.horario
  if (findKeyword(message, ['emergencia', 'urgencia', 'urgente', 'ayuda', 'sangrado', 'peligro'])) return DEMO_RESPONSES.emergencia
  if (findKeyword(message, ['precio', 'costo', 'cuesta', 'valor', 'paga'])) return DEMO_RESPONSES.precio
  if (findKeyword(message, ['perro', 'can', 'cachorro', 'perra'])) return DEMO_RESPONSES.perro
  if (findKeyword(message, ['gato', 'gata', 'minino', 'felino'])) return DEMO_RESPONSES.gato
  if (findKeyword(message, ['recuperacion', 'recuperarse', 'proceso', 'fases', 'etapas'])) return DEMO_RESPONSES.recuperacion
  return DEMO_RESPONSES.default
}

const QUICK_ACTIONS = [
  { label: '🗓️ Agendar cita',     text: 'Quiero agendar una cita de esterilización' },
  { label: '❌ Cancelar cita',     text: 'Necesito cancelar mi cita de esterilización' },
  { label: '📋 Requisitos',        text: '¿Qué documentos y cosas necesito llevar el día de la cirugía?' },
  { label: '💊 Cuidados post-op',  text: '¿Cómo cuido a mi mascota después de la cirugía de esterilización?' },
  { label: '📍 Ver sedes',         text: '¿Dónde están los puntos de atención del IDPYBA?' },
]

const WELCOME = '¡Hola! 🐾 Soy el asistente de esterilizaciones del IDPYBA.\n\n¿En qué etapa del proceso estás?\n• 📅 ¿Necesitas agendar o cancelar una cita?\n• 🏥 ¿Estás en la jornada hoy?\n• 💊 ¿Buscas información sobre cuidados post-op?\n\nCuéntame, con gusto te ayudo 💛'

export default function Chat() {
  const [messages, setMessages] = useState([
    { role: 'assistant', content: WELCOME }
  ])
  const [input, setInput]   = useState('')
  const [loading, setLoading] = useState(false)
  const endRef = useRef(null)

  useEffect(() => {
    endRef.current?.scrollIntoView({ behavior: 'smooth' })
  }, [messages, loading])

  const send = async (text) => {
    const trimmed = text.trim()
    if (!trimmed || loading) return

    const next = [...messages, { role: 'user', content: trimmed }]
    setMessages(next)
    setInput('')
    setLoading(true)

    // Modo demo forzado: siempre se utiliza la lógica local, sin llamada al servidor.
    const demoResponse = getDemoResponse(trimmed)
    setMessages(m => [...m, { role: 'assistant', content: demoResponse }])
    setLoading(false)
  }

  const handleSubmit = (e) => {
    e.preventDefault()
    send(input)
  }

  return (
    <div className="chat-wrap">
      <div className="messages">
        {messages.map((m, i) => (
          <div key={i} className={`msg-row ${m.role === 'assistant' ? 'bot' : 'user'}`}>
            <div className="bubble-text">{m.content}</div>
          </div>
        ))}
        {loading && (
          <div className="msg-row bot">
            <div className="bubble-typing">
              <span /><span /><span />
            </div>
          </div>
        )}
        <div ref={endRef} />
      </div>

      <div className="quick-replies">
        {QUICK_ACTIONS.map(a => (
          <button
            key={a.label}
            className="qr-btn"
            onClick={() => send(a.text)}
            disabled={loading}
          >
            {a.label}
          </button>
        ))}
      </div>

      <form className="input-bar" onSubmit={handleSubmit}>
        <input
          className="chat-input"
          value={input}
          onChange={e => setInput(e.target.value)}
          placeholder="Escribe tu pregunta..."
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
