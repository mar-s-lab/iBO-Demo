import { useState, useEffect, useMemo } from 'react'
import { supabase, isConfigured } from '../lib/supabase'

const CATEGORIES = {
  all:           '🗂️ Todos',
  servicio:      '🛠️ Servicios',
  educacion:     '📚 Educación',
  sede:          '📍 Sedes',
  contacto:      '📞 Contacto',
  institucional: '🏛️ Institucional',
  participacion: '🤝 Participación',
}

const DEMO_FAQS = [
  { id:1,  question:'¿Qué es el IDPYBA?', answer:'El Instituto Distrital de Protección y Bienestar Animal (IDPYBA) es la entidad de Bogotá encargada de proteger y velar por el bienestar de los animales domésticos, de calle y silvestres en la ciudad.', topics:{ name:'Sobre el IDPYBA', category:'institucional' } },
  { id:2,  question:'¿La esterilización tiene algún costo?', answer:'No. El servicio es completamente gratuito. Si alguien le pide dinero por un turno o el procedimiento, es fraude. Puede denunciarlo a las autoridades.', topics:{ name:'Esterilización', category:'servicio' } },
  { id:3,  question:'¿Quiénes pueden acceder a la esterilización gratuita?', answer:'Propietarios en estrato 0-3, animales de calle o ferales, ciudadanos con discapacidad, y fundaciones o refugios. Solo mayores de edad. El animal debe residir en Bogotá.', topics:{ name:'Esterilización', category:'servicio' } },
  { id:4,  question:'¿Cómo se agenda una cita de esterilización?', answer:'Por sistema de turnos digital en línea, en SuperCADE (Américas, Manitas, Suba) o por teléfono al +57 (601) 647 71 17. Máximo 2 citas por ciudadano.', topics:{ name:'Esterilización', category:'servicio' } },
  { id:5,  question:'¿Qué documentos debo llevar a la cita de esterilización?', answer:'Código QR de confirmación, documento de identidad, fotocopia de cédula, fotocopia de recibo de servicio público, collar isabelino, manta/cobija, y correa (perros) o guacal (gatos).', topics:{ name:'Esterilización', category:'servicio' } },
  { id:6,  question:'¿Cómo funciona el proceso de adopción?', answer:'El programa "Adoptar es Amar Sin Condiciones" ofrece perros y gatos recuperados de maltrato. Inicie en la UCA (Cra 106A #67-02, Engativá, mar-dom 10am-3pm) o en adopciones.animalesbog.gov.co/adoptar.', topics:{ name:'Adopción', category:'servicio' } },
  { id:7,  question:'¿Cómo puedo reportar maltrato animal?', answer:'Llame al 123 (24 horas) o al IDPYBA al +57 (601) 647 71 17 en horario hábil (L-V 8 a.m. - 5 p.m.).', topics:{ name:'Escuadrón Anticrueldad', category:'servicio' } },
  { id:8,  question:'¿Qué es TeleVet?', answer:'Servicio de teleorientación veterinaria gratuita para propietarios de mascotas en situación de vulnerabilidad. Llame al +57 (601) 647 71 17 para acceder.', topics:{ name:'TeleVet', category:'servicio' } },
  { id:9,  question:'¿Qué es el MicroChip Ciudadano?', answer:'Servicio gratuito de identificación electrónica para mascotas de hogares en estratos 0-3. Contáctese al +57 (601) 647 71 17 o en cualquier SuperCADE.', topics:{ name:'MicroChip Ciudadano', category:'servicio' } },
  { id:10, question:'¿Dónde queda la sede principal del IDPYBA?', answer:'Carrera 10 #26-51, Edificio Tequendama, Torre Sur, Piso 5. Atiende lunes a viernes de 8:00 a.m. a 5:00 p.m.', topics:{ name:'Sede Administrativa', category:'sede' } },
  { id:11, question:'¿Dónde queda la UCA?', answer:'Carrera 106A #67-02, Barrio El Muelle, Engativá. Adopciones: martes a domingo de 10:00 a.m. a 3:00 p.m. Los lunes está cerrada.', topics:{ name:'UCA', category:'sede' } },
  { id:12, question:'¿Cuáles son los SuperCADE del IDPYBA?', answer:'Manitas (Cra 18L #70B-50 Sur), Américas (Av Cra 86 #43-55 Sur), Suba (Clle 145 #103B-90) y CAD (Cra 30 #25-90). L-V 7am-4:30pm / Sáb 8am-12pm.', topics:{ name:'Sedes', category:'sede' } },
  { id:13, question:'¿Cuál es el teléfono del IDPYBA?', answer:'Principal: +57 (601) 647 71 17 (L-V 8am-5pm). Emergencias animales: 123 (24 horas).', topics:{ name:'Contacto', category:'contacto' } },
  { id:14, question:'¿Cuál es el correo del IDPYBA?', answer:'General: proteccionanimal@animalesbog.gov.co. Disciplinario: disciplinarios@animalesbog.gov.co. Judicial: notificacionesjudiciales@animalesbog.gov.co.', topics:{ name:'Contacto', category:'contacto' } },
  { id:15, question:'¿Cómo presento una queja o sugerencia al IDPYBA?', answer:'A través de Bogotá Te Escucha en bogota.gov.co, por correo a proteccionanimal@animalesbog.gov.co, o presencialmente en cualquier sede.', topics:{ name:'Participación Ciudadana', category:'participacion' } },
]

export default function FAQ() {
  const [faqs,     setFaqs]     = useState([])
  const [loading,  setLoading]  = useState(true)
  const [demo,     setDemo]     = useState(false)
  const [category, setCategory] = useState('all')
  const [search,   setSearch]   = useState('')
  const [expanded, setExpanded] = useState(null)

  useEffect(() => {
    if (!isConfigured) {
      setFaqs(DEMO_FAQS)
      setDemo(true)
      setLoading(false)
      return
    }
    const load = async () => {
      const { data, error } = await supabase
        .from('faq')
        .select('id, question, answer, topics(name, category)')
        .order('id')
      if (error) { setFaqs(DEMO_FAQS); setDemo(true) }
      else        { setFaqs(data ?? []) }
      setLoading(false)
    }
    load()
  }, [])

  const filtered = useMemo(() => {
    const q = search.toLowerCase()
    return faqs.filter(f => {
      const matchCat = category === 'all' || f.topics?.category === category
      const matchQ   = !q ||
        f.question.toLowerCase().includes(q) ||
        f.answer.toLowerCase().includes(q)
      return matchCat && matchQ
    })
  }, [faqs, category, search])

  const toggle = (id) => setExpanded(prev => prev === id ? null : id)

  return (
    <div className="faq-wrap">
      {demo && (
        <div className="demo-banner">
          📋 Modo demo — conecta Supabase en <code>.env</code> para cargar las +115 preguntas reales
        </div>
      )}

      <input
        className="search-input"
        placeholder="🔍 Buscar pregunta o palabra clave..."
        value={search}
        onChange={e => { setSearch(e.target.value); setExpanded(null) }}
      />

      <div className="cat-pills">
        {Object.entries(CATEGORIES).map(([key, label]) => (
          <button
            key={key}
            className={`pill ${category === key ? 'active' : ''}`}
            onClick={() => { setCategory(key); setExpanded(null) }}
          >
            {label}
          </button>
        ))}
      </div>

      {!loading && (
        <p className="faq-count">
          {filtered.length} {filtered.length === 1 ? 'resultado' : 'resultados'}
        </p>
      )}

      <div className="faq-list">
        {loading ? (
          Array.from({ length: 8 }).map((_, i) => (
            <div key={i} className="skeleton skeleton-card" />
          ))
        ) : filtered.length === 0 ? (
          <div className="empty-state">
            <p>No se encontraron resultados para "<strong>{search}</strong>"</p>
          </div>
        ) : (
          filtered.map(faq => (
            <div
              key={faq.id}
              className={`faq-card ${expanded === faq.id ? 'open' : ''}`}
              onClick={() => toggle(faq.id)}
            >
              <div className="faq-q">
                <span>{faq.question}</span>
                <span className="chevron">▼</span>
              </div>
              {expanded === faq.id && (
                <div className="faq-a">
                  {faq.topics?.name && (
                    <span className="topic-tag">{faq.topics.name}</span>
                  )}
                  <p>{faq.answer}</p>
                </div>
              )}
            </div>
          ))
        )}
      </div>
    </div>
  )
}
