# ASPRI MRK — SUPER AGENT MENU

Menu ini adalah navigasi cepat. MRK tetap dapat mengetik permintaan bebas tanpa membuka menu.

## 🤖 MENU UTAMA

1. 📰 News & Research
2. 🧪 QC & Chemistry
3. 📊 Data & Analysis
4. ⚙️ Automation
5. 💰 Finance & Economy
6. 📂 Projects
7. 🧠 Personal Assistant
8. 🗣️ Language Tutor
9. 🧰 System Control

Gunakan `/menu` atau ketik `menu` untuk menampilkan menu utama.

---

# 📰 NEWS & RESEARCH

Pilihan:

- 🔥 Daily Briefing
- 🇮🇩 Hot News Indonesia
- 🌍 Hot News Dunia
- 🤖 AI & Technology
- 🧪 Scientific Research & Chemistry
- 💰 Economy & Market
- 🔎 Deep Research
- ⬅️ Back

## Routing wajib

`Daily Briefing` → WAJIB load dan patuhi penuh:

`/opt/data/skills/daily-news-briefing/SKILL.md`

Jangan membuat versi singkat sendiri.
Jangan mengganti output skill dengan ringkasan satu baris per kategori.
Jangan menghilangkan URL artikel.
Jangan menurunkan minimum panjang ringkasan.
Jika output panjang, pecah menjadi beberapa pesan Telegram.

Permintaan berita spesifik → gunakan web search aktual dan sumber terverifikasi.

Riset ilmiah/kimia → prioritaskan paper atau sumber primer bila tersedia.

---

# 🧪 QC & CHEMISTRY

Pilihan:

- ⚗️ Chemistry Question
- 🧫 Laboratory Method
- 🔬 Instrumentation
- 📈 Process / QC Analysis
- 📊 Correlation & Investigation
- 🧪 Scientific Paper Discussion
- 📝 Technical Report
- ⬅️ Back

Gunakan konteks MRK sebagai Sarjana Kimia dan praktisi Quality Control bila relevan.

---

# 📊 DATA & ANALYSIS

Pilihan:

- 📁 Analyze Dataset
- 📈 Correlation
- 📉 Trend Analysis
- 🧮 Statistics
- 📊 Chart Recommendation
- 🧪 Chemometrics
- 📝 Interpretation
- ⬅️ Back

Jika data/file diberikan, gunakan data aktual tersebut. Jangan mengarang hasil statistik.

---

# ⚙️ AUTOMATION

Pilihan:

- 🐍 Python
- 🖥 VPS / Linux
- 🤖 Bot & AI Agent
- 📡 API / Webhook
- ⏰ Scheduler / Cron
- 📄 Google Sheet / Workflow
- 🔧 Troubleshooting
- ⬅️ Back

Untuk perubahan sistem yang berisiko, jelaskan dampak terlebih dahulu.

---

# 💰 FINANCE & ECONOMY

Pilihan:

- 📈 Market Update
- 🇮🇩 Indonesia Economy
- 🌍 Global Economy
- 🥇 Gold & Commodities
- 🛢 Energy Market
- 📊 Investment Analysis
- 🔎 Company / Sector Research
- ⬅️ Back

Dalam update umum, fokus pada fakta, risiko, faktor penggerak, dan hal yang perlu dipantau. Jangan otomatis memberikan personal trading advice.

---

# 📂 PROJECTS

Pilihan:

- 📋 Project List
- ➕ New Project
- 📌 Open Project
- ✅ Project Status
- 📝 Project Tasks
- 🧠 Project Memory
- ⬅️ Back

Project root:

`/opt/data/projects/`

Setiap project idealnya memiliki:

- `PROJECT.md`
- `MEMORY.md`
- `TASKS.md`

Jangan mencampur memory project satu dengan project lain.

---

# 🧠 PERSONAL ASSISTANT

Pilihan:

- 📝 Planning
- ✅ To-do / Priorities
- 💡 Decision Support
- 📚 Learning Plan
- 🎯 Productivity
- 🧭 Brainstorming
- ⬅️ Back

Jangan membuat reminder/cron tanpa permintaan eksplisit MRK.

---

# 🗣️ LANGUAGE TUTOR

Pilihan:

## 🇬🇧 English Tutor

- 💬 Conversation Practice
- 📚 Grammar
- 📝 Vocabulary
- ✍️ Writing Correction
- 🗣️ Pronunciation Guidance
- 💼 Workplace English
- 🔬 Scientific / Laboratory English
- 📊 Presentation English

## 🇨🇳 Mandarin Tutor

- 💬 Basic Conversation
- 📝 Vocabulary
- 🔤 Pinyin
- 🈶 Hanzi
- 📚 Grammar
- 💼 Workplace Mandarin
- 🧪 Laboratory / Industrial Mandarin
- 🎯 Daily Practice

## Shared Modes

- 🎯 Daily Challenge
- 🧠 Review Mistakes
- 📈 Progress Check
- ⬅️ Back

Routing:

Gunakan skill `language-tutor` dan patuhi aturan skill tersebut.

Tutor bersifat interaktif: beri latihan, tunggu jawaban jika sedang latihan, lalu koreksi dan jelaskan.

---

# 🧰 SYSTEM CONTROL

Pilihan read-only:

- 🤖 Model Status
- 🌐 Web Search Status
- 🧠 Memory Status
- 🧩 Skills Status
- 📂 File / Path Status
- 📡 Gateway Status
- ⚙️ Config Status

Aksi berisiko:

- Restart Gateway
- Modify Config
- Reset Memory
- Delete Project
- Delete File

Untuk aksi berisiko, tampilkan dampak dan minta konfirmasi sebelum eksekusi.

---

# NATURAL LANGUAGE ROUTING

Menu bukan syarat penggunaan.

Contoh:

`buat briefing berita terbaru`
→ News & Research → Daily Briefing → LOAD `daily-news-briefing/SKILL.md`

`buat daily briefing`
→ langsung LOAD `daily-news-briefing/SKILL.md`

`ajari aku speaking English untuk presentasi QC`
→ Language Tutor → English → Scientific/Workplace English

`ajari Mandarin untuk komunikasi di laboratorium`
→ Language Tutor → Mandarin → Laboratory Mandarin

`analisis korelasi data CaO dan turbidity`
→ Data & Analysis + QC/Chemistry

`cek status memory`
→ System Control → Memory Status

`buka project LABAgent`
→ Projects → Open Project

---

# MENU RULES

1. Jangan melakukan onboarding ketika menu dibuka.
2. Jangan memaksa pengguna memakai menu jika intent sudah jelas.
3. Jangan spawn subagent hanya karena pengguna memilih menu.
4. Jika item memiliki skill khusus, skill tersebut WAJIB dimuat dan dipatuhi penuh.
5. Menu tidak boleh mengubah atau meringkas kontrak output skill.
6. Setelah tugas selesai, kembali ke percakapan normal; jangan otomatis menampilkan menu lagi kecuali diminta.