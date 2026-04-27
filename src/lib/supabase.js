import { createClient } from '@supabase/supabase-js'

const url = import.meta.env.VITE_SUPABASE_URL
const key = import.meta.env.VITE_SUPABASE_ANON_KEY

export const isConfigured = !!(url && key)

export const supabase = isConfigured ? createClient(url, key) : null

if (!isConfigured) {
  console.warn('⚠️ Supabase no configurado — FAQ mostrará datos demo. Agrega VITE_SUPABASE_URL y VITE_SUPABASE_ANON_KEY en .env')
}
