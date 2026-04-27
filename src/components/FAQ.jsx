import { useState, useEffect, useMemo } from 'react'
import { supabase } from '../lib/supabase'

const CATEGORIES = {
  all:           '🗂️ Todos',
  servicio:      '🛠️ Servicios',
  educacion:     '📚 Educación',
  sede:          '📍 Sedes',
  contacto:      '📞 Contacto',
  institucional: '🏛️ Institucional',
  participacion: '🤝 Participación',
}

export default function FAQ() {
  const [faqs,     setFaqs]     = useState([])
  const [loading,  setLoading]  = useState(true)
  const [error,    setError]    = useState(null)
  const [category, setCategory] = useState('all')
  const [search,   setSearch]   = useState('')
  const [expanded, setExpanded] = useState(null)

  useEffect(() => {
    const load = async () => {
      setLoading(true)
      const { data, error } = await supabase
        .from('faq')
        .select('id, question, answer, topics(name, category)')
        .order('id')

      if (error) {
        setError('No se pudo conectar con la base de datos. Revisa las variables de entorno.')
      } else {
        setFaqs(data ?? [])
      }
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

  if (error) {
    return (
      <div className="empty-state">
        <p>⚠️ {error}</p>
      </div>
    )
  }

  return (
    <div className="faq-wrap">
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
