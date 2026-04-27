import { useState } from 'react'
import Chat from './components/Chat'
import FAQ  from './components/FAQ'

export default function App() {
  const [tab, setTab] = useState('chat')

  return (
    <div className="app">
      <header className="header">
        <div className="header-avatar">🐾</div>
        <div className="header-info">
          <div className="header-name">Aguapanela</div>
          <div className="header-sub">te ayudo a agendar y cuidar tu mascota</div>
        </div>
        <div className="header-status">
          <span className="status-dot" />
          En línea
        </div>
      </header>

      <nav className="tabs">
        <button
          className={`tab ${tab === 'chat' ? 'active' : ''}`}
          onClick={() => setTab('chat')}
        >
          💬 Asistente
        </button>
        <button
          className={`tab ${tab === 'faq' ? 'active' : ''}`}
          onClick={() => setTab('faq')}
        >
          📋 Preguntas frecuentes
        </button>
      </nav>

      <main className="content">
        {tab === 'chat' ? <Chat /> : <FAQ />}
      </main>
    </div>
  )
}
