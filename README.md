# IDPYBA Assistant Demo

> A web application providing a virtual assistant for pet sterilization guidance and FAQ at the Instituto Distrital de Protección y Bienestar Animal (IDPYBA) in Bogotá.

---

## What is this?

This project is a demo of a conversational assistant web app designed to guide citizens through the pet sterilization process at IDPYBA. It includes a chatbot for personalized assistance and an FAQ section powered by embeddings for relevant question matching. The backend uses Supabase for data storage, and OpenAI for generating text embeddings.

---

## Who is it for?

- **Citizens**: Individuals seeking information and guidance on pet sterilization procedures.
- **IDPYBA Staff**: Personnel who may need to reference or update the FAQ and chatbot responses.
- **Developers**: Team members working on similar virtual assistant projects within Imagine Apps.

---

## Repository Structure

```
iBO-Demo/
├── 01_schema.sql              → Database schema for Supabase
├── 02_seed_topics.sql         → Seed data for topics
├── 03_seed_faq.sql            → Seed data for FAQ
├── 04_system_prompt_chatbot.md → System prompt for the chatbot
├── 05_generate_embeddings.py  → Script to generate embeddings using OpenAI
├── index.html                 → Main HTML file
├── main.jsx                   → React app entry point
├── package.json               → Node.js dependencies and scripts
├── vite.config.js             → Vite configuration
├── components/                → React components (Chat.jsx, FAQ.jsx)
├── lib/                       → Supabase client library
├── src/                       → Source code (App.jsx, index.css)
└── README.md                  → This file
```

---

## How to Start

### Prerequisites
- Node.js 18+
- Python 3.10+
- Access to Supabase project
- OpenAI API key

### Installation
```bash
git clone <repository-url>
cd iBO-Demo
npm install
pip install openai supabase python-dotenv
```

### Configuration
Copy the environment file and fill in the required variables:
```bash
cp .env.example .env
```

Required environment variables:
- `SUPABASE_URL`
- `SUPABASE_SERVICE_KEY`
- `OPENAI_API_KEY`

Run the database setup scripts in Supabase, then generate embeddings:
```bash
python 05_generate_embeddings.py
```

Start the development server:
```bash
npm run dev
```

---

## Main Usage

The app has two main sections:
1. **Chat Assistant**: Users can interact with a chatbot that guides them through the sterilization process, from scheduling to post-operative care.
2. **FAQ**: A searchable FAQ section that uses embeddings to find the most relevant answers to user questions.

Access the app at `http://localhost:5173` after starting the dev server.

---

## Related Documentation

| Resource | Link |
|---|---|
| IDPYBA Official Website | [link] |
| Supabase Documentation | [link] |
| OpenAI Embeddings Guide | [link] |

---

## Project Status

| Item | Status |
|---|---|
| Current Version | `v1.0.0` |
| Environment | `development` |
| Last Update | 2026-04-23 |
| Responsible | Imagine Apps Team |

---

## Contribute

- Use feature branches for changes.
- Submit pull requests for review.
- Follow the existing code style and structure.

---

## License / Internal Use

> This project is property of Imagine Apps and was developed by [developer name]. Internal use only.

---

# Demo del Asistente IDPYBA

> Una aplicación web que proporciona un asistente virtual para la guía de esterilización de mascotas en el Instituto Distrital de Protección y Bienestar Animal (IDPYBA) de Bogotá.

---

## ¿Qué es esto?

Este proyecto es una demo de una aplicación web de asistente conversacional diseñada para guiar a los ciudadanos a través del proceso de esterilización de mascotas en IDPYBA. Incluye un chatbot para asistencia personalizada y una sección de preguntas frecuentes impulsada por embeddings para la coincidencia de preguntas relevantes. El backend utiliza Supabase para el almacenamiento de datos y OpenAI para generar embeddings de texto.

---

## ¿Para quién es?

- **Ciudadanos**: Personas que buscan información y guía sobre procedimientos de esterilización de mascotas.
- **Personal de IDPYBA**: Empleados que pueden necesitar referenciar o actualizar las FAQ y respuestas del chatbot.
- **Desarrolladores**: Miembros del equipo que trabajan en proyectos similares de asistentes virtuales dentro de Imagine Apps.

---

## Estructura del repositorio

```
iBO-Demo/
├── 01_schema.sql              → Esquema de base de datos para Supabase
├── 02_seed_topics.sql         → Datos semilla para temas
├── 03_seed_faq.sql            → Datos semilla para FAQ
├── 04_system_prompt_chatbot.md → Prompt del sistema para el chatbot
├── 05_generate_embeddings.py  → Script para generar embeddings usando OpenAI
├── index.html                 → Archivo HTML principal
├── main.jsx                   → Punto de entrada de la app React
├── package.json               → Dependencias y scripts de Node.js
├── vite.config.js             → Configuración de Vite
├── components/                → Componentes React (Chat.jsx, FAQ.jsx)
├── lib/                       → Librería cliente de Supabase
├── src/                       → Código fuente (App.jsx, index.css)
└── README.md                  → Este archivo
```

---

## Cómo empezar

### Prerequisitos
- Node.js 18+
- Python 3.10+
- Acceso a proyecto de Supabase
- Clave de API de OpenAI

### Instalación
```bash
git clone <repository-url>
cd iBO-Demo
npm install
pip install openai supabase python-dotenv
```

### Configuración
Copia el archivo de variables de entorno y complétalo:
```bash
cp .env.example .env
```

Variables de entorno requeridas:
- `SUPABASE_URL`
- `SUPABASE_SERVICE_KEY`
- `OPENAI_API_KEY`

Ejecuta los scripts de configuración de base de datos en Supabase, luego genera los embeddings:
```bash
python 05_generate_embeddings.py
```

Inicia el servidor de desarrollo:
```bash
npm run dev
```

---

## Uso principal

La app tiene dos secciones principales:
1. **Asistente de Chat**: Los usuarios pueden interactuar con un chatbot que los guía a través del proceso de esterilización, desde la programación hasta el cuidado postoperatorio.
2. **Preguntas Frecuentes**: Una sección de FAQ searchable que utiliza embeddings para encontrar las respuestas más relevantes a las preguntas de los usuarios.

Accede a la app en `http://localhost:5173` después de iniciar el servidor de desarrollo.

---

## Documentación relacionada

| Recurso | Enlace |
|---|---|
| Sitio web oficial de IDPYBA | [link] |
| Documentación de Supabase | [link] |
| Guía de Embeddings de OpenAI | [link] |

---

## Estado del proyecto

| Item | Estado |
|---|---|
| Versión actual | `v1.0.0` |
| Ambiente | `desarrollo` |
| Última actualización | 2026-04-23 |
| Responsable | Equipo de Imagine Apps |

---

## Contribuir

- Usa ramas de características para cambios.
- Envía solicitudes de extracción para revisión.
- Sigue el estilo de código y estructura existentes.

---

## Licencia / Uso interno

> Este proyecto es propiedad de Imagine Apps y fue desarrollado por [nombre del desarrollador]. Uso interno únicamente.