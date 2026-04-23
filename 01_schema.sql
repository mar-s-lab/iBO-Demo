-- ============================================================
-- IDPYBA - Base de datos de preguntas y respuestas
-- Esquema para Supabase (FAQ + RAG híbrido)
-- ============================================================

-- Extensión para búsqueda vectorial (RAG / chatbot semántico)
CREATE EXTENSION IF NOT EXISTS vector;

-- ============================================================
-- TABLA: topics
-- Categorías temáticas que agrupan las preguntas
-- ============================================================
CREATE TABLE IF NOT EXISTS topics (
  id          SERIAL PRIMARY KEY,
  slug        TEXT UNIQUE NOT NULL,
  name        TEXT NOT NULL,
  category    TEXT NOT NULL CHECK (category IN (
                'servicio', 'educacion', 'contacto',
                'institucional', 'participacion', 'sede'
              )),
  description TEXT,
  created_at  TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================================
-- TABLA: faq
-- Preguntas y respuestas con soporte para búsqueda vectorial
-- ============================================================
CREATE TABLE IF NOT EXISTS faq (
  id          SERIAL PRIMARY KEY,
  topic_id    INTEGER REFERENCES topics(id) ON DELETE SET NULL,
  question    TEXT NOT NULL,
  answer      TEXT NOT NULL,
  keywords    TEXT[],
  source_url  TEXT DEFAULT 'https://www.animalesbog.gov.co',
  embedding   VECTOR(1536),           -- compatible con text-embedding-ada-002
  created_at  TIMESTAMPTZ DEFAULT NOW()
);

-- Índice para similitud coseno (búsqueda semántica)
CREATE INDEX IF NOT EXISTS faq_embedding_idx
  ON faq USING ivfflat (embedding vector_cosine_ops)
  WITH (lists = 100);

-- Índice de texto completo en español (búsqueda por palabras clave)
CREATE INDEX IF NOT EXISTS faq_fts_idx
  ON faq USING GIN (
    to_tsvector('spanish', question || ' ' || answer)
  );

-- ============================================================
-- FUNCIÓN: búsqueda semántica por embedding
-- Uso: SELECT * FROM search_faq(embedding_vector, 0.7, 5);
-- ============================================================
CREATE OR REPLACE FUNCTION search_faq(
  query_embedding VECTOR(1536),
  similarity_threshold FLOAT DEFAULT 0.7,
  match_count INT DEFAULT 5
)
RETURNS TABLE (
  id          INT,
  topic_id    INT,
  topic_name  TEXT,
  question    TEXT,
  answer      TEXT,
  keywords    TEXT[],
  similarity  FLOAT
)
LANGUAGE SQL STABLE
AS $$
  SELECT
    f.id,
    f.topic_id,
    t.name AS topic_name,
    f.question,
    f.answer,
    f.keywords,
    1 - (f.embedding <=> query_embedding) AS similarity
  FROM faq f
  LEFT JOIN topics t ON t.id = f.topic_id
  WHERE 1 - (f.embedding <=> query_embedding) > similarity_threshold
  ORDER BY f.embedding <=> query_embedding
  LIMIT match_count;
$$;

-- ============================================================
-- FUNCIÓN: búsqueda por texto completo
-- Uso: SELECT * FROM search_faq_text('esterilización gratuita');
-- ============================================================
CREATE OR REPLACE FUNCTION search_faq_text(
  query_text TEXT,
  match_count INT DEFAULT 10
)
RETURNS TABLE (
  id         INT,
  topic_name TEXT,
  question   TEXT,
  answer     TEXT,
  rank       FLOAT
)
LANGUAGE SQL STABLE
AS $$
  SELECT
    f.id,
    t.name AS topic_name,
    f.question,
    f.answer,
    ts_rank(to_tsvector('spanish', f.question || ' ' || f.answer),
            plainto_tsquery('spanish', query_text)) AS rank
  FROM faq f
  LEFT JOIN topics t ON t.id = f.topic_id
  WHERE to_tsvector('spanish', f.question || ' ' || f.answer)
        @@ plainto_tsquery('spanish', query_text)
  ORDER BY rank DESC
  LIMIT match_count;
$$;
