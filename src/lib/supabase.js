import { createClient } from '@supabase/supabase-js'

const url = import.meta.env.VITE_SUPABASE_URL
const key = import.meta.env.VITE_SUPABASE_ANON_KEY

export const isConfigured = !!(url && key)

export const supabase = isConfigured ? createClient(url, key) : null

if (!isConfigured && import.meta.env.DEV) {
  console.warn('⚠️ Supabase no configurado — FAQ mostrará datos demo.')
}
