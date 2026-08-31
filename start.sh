#!/usr/bin/env bash
set -e

echo "=========================================="
echo "        ASPRI MRK BOOT SEQUENCE"
echo "=========================================="

echo "HERMES_HOME : ${HERMES_HOME}"
echo "Timezone    : ${TZ}"
echo

echo "[1/8] Checking SOUL..."
test -f /opt/data/SOUL.md \
    && echo "✅ SOUL.md" \
    || { echo "❌ SOUL.md missing"; exit 1; }

echo "[2/8] Checking USER..."
test -f /opt/data/memories/USER.md \
    && echo "✅ USER.md" \
    || { echo "❌ USER.md missing"; exit 1; }

echo "[3/8] Checking MEMORY..."
test -f /opt/data/memories/MEMORY.md \
    && echo "✅ MEMORY.md" \
    || { echo "❌ MEMORY.md missing"; exit 1; }

echo "[4/8] Checking menu..."
test -f /opt/data/menu/MENU.md \
    && echo "✅ Super Agent menu" \
    || { echo "❌ MENU.md missing"; exit 1; }

echo "[5/8] Checking Telegram menu hook..."
test -f /opt/data/hooks/telegram-menu/HOOK.yaml \
    && test -f /opt/data/hooks/telegram-menu/handler.py \
    && echo "✅ Telegram persistent menu hook" \
    || { echo "❌ Telegram menu hook missing"; exit 1; }

echo "[6/8] Checking Daily News skill..."
test -f /opt/data/skills/daily-news-briefing/SKILL.md \
    && echo "✅ Daily News Briefing skill" \
    || { echo "❌ Daily News Briefing skill missing"; exit 1; }

echo "[7/8] Checking Language Tutor skill..."
test -f /opt/data/skills/language-tutor/SKILL.md \
    && echo "✅ Language Tutor skill" \
    || { echo "❌ Language Tutor skill missing"; exit 1; }

echo "[8/8] Checking Projects workspace..."
test -f /opt/data/projects/README.md \
    && echo "✅ Projects workspace" \
    || { echo "❌ Projects workspace missing"; exit 1; }

echo
echo "Super Agent : ENABLED"
echo "Telegram UI : PERSISTENT MENU ENABLED"
echo "Cron bootstrap: DISABLED"
echo
echo "Starting Hermes Gateway..."
echo "=========================================="

exec hermes gateway run