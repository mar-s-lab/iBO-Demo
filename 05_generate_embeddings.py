"""
IDPYBA - Generador de embeddings para la tabla faq
Usa OpenAI text-embedding-ada-002 + Supabase

Requisitos:
  pip install openai supabase python-dotenv

Uso:
  1. Copia .env.example → .env y llena las variables
  2. python 05_generate_embeddings.py
"""

import os
import time
from dotenv import load_dotenv
from openai import OpenAI
from supabase import create_client

load_dotenv()

SUPABASE_URL     = os.environ["SUPABASE_URL"]
SUPABASE_KEY     = os.environ["SUPABASE_SERVICE_KEY"]   # service_role key
OPENAI_API_KEY   = os.environ["OPENAI_API_KEY"]
EMBEDDING_MODEL  = "text-embedding-ada-002"             # 1536 dims

openai_client   = OpenAI(api_key=OPENAI_API_KEY)
supabase_client = create_client(SUPABASE_URL, SUPABASE_KEY)


def embed(text: str) -> list[float]:
    response = openai_client.embeddings.create(input=text, model=EMBEDDING_MODEL)
    return response.data[0].embedding


def main():
    print("🔍 Obteniendo registros sin embedding...")
    result = (
        supabase_client
        .table("faq")
        .select("id, question, answer")
        .is_("embedding", "null")
        .execute()
    )

    rows = result.data
    if not rows:
        print("✅ Todos los registros ya tienen embedding.")
        return

    print(f"📝 {len(rows)} registros pendientes.\n")

    for i, row in enumerate(rows, 1):
        text = f"{row['question']} {row['answer']}"
        try:
            vector = embed(text)
            supabase_client.table("faq").update(
                {"embedding": vector}
            ).eq("id", row["id"]).execute()
            print(f"  [{i}/{len(rows)}] ✅ FAQ #{row['id']} — {row['question'][:60]}...")
        except Exception as e:
            print(f"  [{i}/{len(rows)}] ❌ FAQ #{row['id']} — Error: {e}")

        time.sleep(0.1)   # evitar rate-limit

    print("\n🎉 Embeddings generados correctamente.")


if __name__ == "__main__":
    main()
