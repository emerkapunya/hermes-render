"""Persistent Telegram reply-keyboard menu for Aspri MRK.

The hook is intentionally UI-only. It does not call the LLM and does not
replace Hermes routing. Button presses arrive back to Hermes as ordinary text,
so the existing SOUL/skills continue to decide what the agent should do.
"""

import os
from typing import Optional

import httpx

TOKEN = os.getenv("TELEGRAM_BOT_TOKEN", "").strip()

MAIN_MENU = [
    ["📰 News & Research", "🧪 QC & Chemistry"],
    ["📊 Data & Analysis", "⚙️ Automation"],
    ["💰 Finance & Economy", "📂 Projects"],
    ["🧠 Personal Assistant", "🗣️ Language Tutor"],
    ["🧰 System Control"],
]

SUBMENUS = {
    "📰 News & Research": [
        ["🔥 Daily Briefing", "🇮🇩 Hot News Indonesia"],
        ["🌍 Hot News Dunia", "🤖 AI & Technology"],
        ["🧪 Scientific Research & Chemistry"],
        ["💰 Economy & Market", "🔎 Deep Research"],
        ["🏠 Menu Utama", "❌ Tutup Menu"],
    ],
    "🧪 QC & Chemistry": [
        ["⚗️ Chemistry Question", "🧫 Laboratory Method"],
        ["🔬 Instrumentation", "📈 Process / QC Analysis"],
        ["📊 Correlation & Investigation"],
        ["🧪 Scientific Paper Discussion", "📝 Technical Report"],
        ["🏠 Menu Utama", "❌ Tutup Menu"],
    ],
    "📊 Data & Analysis": [
        ["📁 Analyze Dataset", "📈 Correlation"],
        ["📉 Trend Analysis", "🧮 Statistics"],
        ["📊 Chart Recommendation", "🧪 Chemometrics"],
        ["📝 Interpretation"],
        ["🏠 Menu Utama", "❌ Tutup Menu"],
    ],
    "⚙️ Automation": [
        ["🐍 Python", "🖥 VPS / Linux"],
        ["🤖 Bot & AI Agent", "📡 API / Webhook"],
        ["⏰ Scheduler / Cron"],
        ["📄 Google Sheet / Workflow", "🔧 Troubleshooting"],
        ["🏠 Menu Utama", "❌ Tutup Menu"],
    ],
    "💰 Finance & Economy": [
        ["📈 Market Update", "🇮🇩 Indonesia Economy"],
        ["🌍 Global Economy", "🥇 Gold & Commodities"],
        ["🛢 Energy Market", "📊 Investment Analysis"],
        ["🔎 Company / Sector Research"],
        ["🏠 Menu Utama", "❌ Tutup Menu"],
    ],
    "📂 Projects": [
        ["📋 Project List", "➕ New Project"],
        ["📌 Open Project", "✅ Project Status"],
        ["📝 Project Tasks", "🧠 Project Memory"],
        ["🏠 Menu Utama", "❌ Tutup Menu"],
    ],
    "🧠 Personal Assistant": [
        ["📝 Planning", "✅ To-do / Priorities"],
        ["💡 Decision Support", "📚 Learning Plan"],
        ["🎯 Productivity", "🧭 Brainstorming"],
        ["🏠 Menu Utama", "❌ Tutup Menu"],
    ],
    "🗣️ Language Tutor": [
        ["🇬🇧 English Tutor", "🇨🇳 Mandarin Tutor"],
        ["💬 Conversation Practice", "📝 Vocabulary Practice"],
        ["📚 Grammar", "✍️ Writing Correction"],
        ["🔬 Scientific / Technical Language"],
        ["🎯 Daily Challenge", "📈 Progress Check"],
        ["🏠 Menu Utama", "❌ Tutup Menu"],
    ],
    "🇬🇧 English Tutor": [
        ["💬 English Conversation", "📚 English Grammar"],
        ["📝 English Vocabulary", "✍️ English Writing"],
        ["🗣️ English Pronunciation"],
        ["💼 Workplace English", "🔬 Scientific English"],
        ["📊 Presentation English"],
        ["⬅️ Language Tutor", "🏠 Menu Utama"],
    ],
    "🇨🇳 Mandarin Tutor": [
        ["💬 Mandarin Conversation", "📝 Mandarin Vocabulary"],
        ["🔤 Pinyin", "🈶 Hanzi"],
        ["📚 Mandarin Grammar", "💼 Workplace Mandarin"],
        ["🧪 Laboratory / Industrial Mandarin"],
        ["🎯 Mandarin Daily Practice"],
        ["⬅️ Language Tutor", "🏠 Menu Utama"],
    ],
    "🧰 System Control": [
        ["🤖 Model Status", "🌐 Web Search Status"],
        ["🧠 Memory Status", "🧩 Skills Status"],
        ["📂 File / Path Status", "📡 Gateway Status"],
        ["⚙️ Config Status"],
        ["🏠 Menu Utama", "❌ Tutup Menu"],
    ],
}

GREETING = {
    "halo", "hai", "hi", "hello", "hey", "pagi", "selamat pagi",
    "siang", "selamat siang", "sore", "selamat sore", "malam",
    "selamat malam",
}


def _reply_markup(rows):
    return {
        "keyboard": [[{"text": text} for text in row] for row in rows],
        "resize_keyboard": True,
        "is_persistent": True,
        "input_field_placeholder": "Pilih menu atau ketik permintaan...",
    }


async def _send(chat_id: str, text: str, rows=None, remove=False, thread_id: Optional[str] = None):
    if not TOKEN or not chat_id:
        return

    payload = {"chat_id": chat_id, "text": text}
    if remove:
        payload["reply_markup"] = {"remove_keyboard": True}
    elif rows is not None:
        payload["reply_markup"] = _reply_markup(rows)

    if thread_id:
        try:
            payload["message_thread_id"] = int(thread_id)
        except (TypeError, ValueError):
            pass

    async with httpx.AsyncClient(timeout=10) as client:
        response = await client.post(
            f"https://api.telegram.org/bot{TOKEN}/sendMessage",
            json=payload,
        )
        response.raise_for_status()


async def _show_main(chat_id: str, thread_id: Optional[str] = None):
    await _send(
        chat_id,
        "🤖 ASPRI MRK — SUPER AGENT\nSilakan pilih menu atau ketik permintaan langsung.",
        MAIN_MENU,
        thread_id=thread_id,
    )


async def handle(event_type: str, context: dict):
    if context.get("platform") != "telegram":
        return

    # Slash commands do not always carry chat_id. For Telegram DM the user_id
    # is a valid destination and is the desired fallback for /start and /new.
    if event_type.startswith("command:"):
        command = str(context.get("command", "")).lower().lstrip("/")
        if command in {"start", "new", "reset", "menu"}:
            chat_id = str(context.get("chat_id") or context.get("user_id") or "")
            await _show_main(chat_id)
        return

    if event_type != "agent:end":
        return

    message = str(context.get("message", "")).strip()
    normalized = message.lower()
    chat_id = str(context.get("chat_id") or context.get("user_id") or "")
    thread_id = context.get("thread_id") or None

    if not chat_id:
        return

    # Greeting and explicit menu request: show main menu automatically.
    if normalized in GREETING or normalized in {"menu", "/menu", "🏠 menu utama"}:
        await _show_main(chat_id, thread_id)
        return

    # Category buttons: switch the persistent keyboard to that submenu.
    if message in SUBMENUS:
        await _send(
            chat_id,
            f"{message}\nPilih fungsi:",
            SUBMENUS[message],
            thread_id=thread_id,
        )
        return

    if message == "⬅️ Language Tutor":
        await _send(
            chat_id,
            "🗣️ Language Tutor\nPilih bahasa atau mode latihan:",
            SUBMENUS["🗣️ Language Tutor"],
            thread_id=thread_id,
        )
        return

    if normalized in {"tutup menu", "❌ tutup menu"}:
        await _send(
            chat_id,
            "✅ Menu disembunyikan. Ketik `menu` kapan saja untuk menampilkannya lagi.",
            remove=True,
            thread_id=thread_id,
        )
