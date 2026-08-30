#!/usr/bin/env bash
set -e

JOB_NAME="Daily News & AI-Finance Digest"
PROMPT_FILE="/opt/bootstrap/daily_news_prompt.txt"

echo "=== Aspri MRK bootstrap ==="

if hermes cron list 2>/dev/null | grep -Fq "$JOB_NAME"; then
    echo "Cron '$JOB_NAME' sudah tersedia."
else
    echo "Membuat cron '$JOB_NAME'..."

    hermes cron create \
        "0 6 * * *" \
        "$(cat "$PROMPT_FILE")" \
        --deliver telegram \
        --name "$JOB_NAME"

    echo "Cron berhasil dibuat."
fi

echo "Daftar cron:"
hermes cron list || true

echo "Menjalankan Hermes Gateway..."
exec hermes gateway run
