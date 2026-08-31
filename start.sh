#!/usr/bin/env bash
set -e

echo "=========================================="
echo "        ASPRI MRK BOOT SEQUENCE"
echo "=========================================="

echo "HERMES_HOME : ${HERMES_HOME}"
echo "Timezone    : ${TZ}"
echo

# =========================================================
# CHECK CONFIG
# =========================================================

echo "[1/5] Checking config..."

if [ -f /opt/data/config.yaml ]; then
    echo "✅ config.yaml"
else
    echo "❌ config.yaml missing"
    exit 1
fi

# =========================================================
# CHECK SOUL
# =========================================================

echo "[2/5] Checking SOUL..."

if [ -f /opt/data/SOUL.md ]; then
    echo "✅ SOUL.md loaded"
else
    echo "❌ SOUL.md missing"
    exit 1
fi

# =========================================================
# CHECK USER
# =========================================================

echo "[3/5] Checking USER..."

if [ -f /opt/data/memories/USER.md ]; then
    echo "✅ USER.md loaded"
else
    echo "❌ USER.md missing"
    exit 1
fi

# =========================================================
# CHECK MEMORY
# =========================================================

echo "[4/5] Checking MEMORY..."

if [ -f /opt/data/memories/MEMORY.md ]; then
    echo "✅ MEMORY.md loaded"
else
    echo "❌ MEMORY.md missing"
    exit 1
fi

# =========================================================
# CHECK / CREATE CRON
# =========================================================

echo "[5/5] Checking cron..."

JOB_NAME="Daily News & AI-Finance Digest"
PROMPT_FILE="/opt/bootstrap/daily_news_prompt.txt"

if hermes cron list 2>/dev/null | grep -Fq "$JOB_NAME"; then

    echo "✅ Cron already exists:"
    echo "   $JOB_NAME"

else

    echo "⚠️ Cron not found."
    echo "Creating cron..."

    hermes cron create \
        "0 6 * * *" \
        "$(cat "$PROMPT_FILE")" \
        --deliver telegram \
        --name "$JOB_NAME"

    echo "✅ Cron created:"
    echo "   $JOB_NAME"
fi

echo
echo "=========================================="
echo "CURRENT HERMES FILES"
echo "=========================================="

echo "SOUL:"
ls -lh /opt/data/SOUL.md

echo
echo "USER:"
ls -lh /opt/data/memories/USER.md

echo
echo "MEMORY:"
ls -lh /opt/data/memories/MEMORY.md

echo
echo "CRON:"
hermes cron list || true

echo
echo "=========================================="
echo "        STARTING HERMES GATEWAY"
echo "=========================================="

exec hermes gateway run
