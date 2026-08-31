#!/usr/bin/env bash
set -e

echo "=========================================="
echo "        ASPRI MRK BOOT SEQUENCE"
echo "=========================================="

echo "HERMES_HOME : ${HERMES_HOME}"
echo "Timezone    : ${TZ}"
echo

echo "[1/4] Checking SOUL..."
test -f /opt/data/SOUL.md \
    && echo "✅ SOUL.md" \
    || { echo "❌ SOUL.md missing"; exit 1; }

echo "[2/4] Checking USER..."
test -f /opt/data/memories/USER.md \
    && echo "✅ USER.md" \
    || { echo "❌ USER.md missing"; exit 1; }

echo "[3/4] Checking MEMORY..."
test -f /opt/data/memories/MEMORY.md \
    && echo "✅ MEMORY.md" \
    || { echo "❌ MEMORY.md missing"; exit 1; }

echo "[4/4] Checking skills..."
test -f /opt/data/skills/daily-news-briefing/SKILL.md \
    && echo "✅ Daily News Briefing skill" \
    || echo "⚠️ Daily News Briefing skill missing"

echo
echo "Cron bootstrap: DISABLED"
echo
echo "Starting Hermes Gateway..."
echo "=========================================="

exec hermes gateway run
