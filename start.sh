#!/usr/bin/env bash

set -e

echo "========================================"
echo "       ASPRI MRK STARTING"
echo "========================================"

echo "HERMES_HOME=$HERMES_HOME"
echo "Timezone=$TZ"

echo
echo "Checking identity and memory files..."

test -f /opt/data/SOUL.md \
    && echo "✓ SOUL.md loaded" \
    || echo "✗ SOUL.md missing"

test -f /opt/data/memories/USER.md \
    && echo "✓ USER.md loaded" \
    || echo "✗ USER.md missing"

test -f /opt/data/memories/MEMORY.md \
    && echo "✓ MEMORY.md loaded" \
    || echo "✗ MEMORY.md missing"

echo
echo "Checking cron..."

JOB_NAME="Daily News & AI-Finance Digest"
PROMPT_FILE="/opt/bootstrap/daily_news_prompt.txt"

if hermes cron list 2>/dev/null | grep -Fq "$JOB_NAME"; then
    echo "✓ Cron already exists: $JOB_NAME"
else
    echo "Creating cron: $JOB_NAME"

    hermes cron create \
        "0 6 * * *" \
        "$(cat "$PROMPT_FILE")" \
        --deliver telegram \
        --name "$JOB_NAME"

    echo "✓ Cron created"
fi

echo
echo "Current cron jobs:"
hermes cron list || true

echo
echo "Starting Hermes Gateway..."
echo "========================================"

exec hermes gateway run
