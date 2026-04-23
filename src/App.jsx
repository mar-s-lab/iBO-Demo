import { useState } from 'react'
import Chat from './components/Chat'
import FAQ  from './components/FAQ'

const TABS = [
  { id: 'chat', label: '💬 Asistente de Esterilizaciones' },
  { id: 'faq',  label: '📋 Preguntas Frecuentes' },
]

export default function App() {
  const [tab, setTab] = useState('chat')

  return (
    <div className="app">
      <header className="header">
        <div className="header-avatar">🐾</div>
        <div className="header-info">
          <h1 className="header-name">IDPYBA — Asistente Virtual</h1>
          <p className="header-sub">Instituto Distrital de Protección y Bienestar Animal · Bogotá</p>
        </div>
        <div className="header-status">
          <span className="status-dot"></span>
          En línea
        </div>
      </header>

      <nav className="tabs">
        {TABS.map(t => (
          <button
            key={t.id}
            className={`tab ${tab === t.id ? 'active' : ''}`}
            onClick={() => setTab(t.id)}
          >
            {t.label}
          </button>
        ))}
      </nav>

      <main className="content">
        {tab === 'chat' ? <Chat /> : <FAQ />}
      </main>
    </div>
  )
}
