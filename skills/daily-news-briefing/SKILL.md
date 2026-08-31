---
name: daily-news-briefing
description: Membuat briefing berita terkini Indonesia dan dunia berdasarkan web search aktual dengan beberapa berita per kategori, ringkasan substantif, dan URL artikel asli.
version: 5.0.0
author: MRK
---

# DAILY NEWS BRIEFING — ASPRI MRK

## PURPOSE

Skill ini digunakan ketika MRK meminta:

- briefing berita;
- berita terbaru;
- briefing pagi;
- hot news;
- breaking news;
- news update;
- update AI;
- update teknologi;
- update ekonomi;
- update investasi.

Skill berjalan di main agent.

JANGAN menggunakan subagent secara default.

JANGAN membuat cron.

JANGAN membuat file output secara default.

Hasil lengkap harus langsung ditampilkan dalam percakapan.

---

# CURRENT INFORMATION RULE

Berita terkini harus berasal dari web.

WAJIB gunakan:

`web_search`

Jika tersedia dan diperlukan, gunakan:

`web_extract`

Pengetahuan internal model tidak boleh digunakan sebagai satu-satunya sumber berita terkini.

---

# PROVIDER INDEPENDENCE

Skill tidak bergantung pada provider web tertentu.

Jangan mengunci ke:

- Tavily;
- DDGS;
- Brave;
- Exa;
- Firecrawl;
- provider lain.

Gunakan backend yang tersedia melalui Hermes.

Jika backend pertama gagal:

coba fallback yang tersedia.

---

# SEARCH FAILURE

Jika web_search pertama gagal:

1. coba query sederhana;
2. coba query alternatif;
3. coba kategori lain;
4. coba fallback backend yang tersedia.

Jika tool web benar-benar tidak tersedia:

BERHENTI.

Tampilkan:

"Web search saat ini tidak tersedia sehingga saya tidak akan membuat briefing yang belum terverifikasi."

Jangan membuat berita dari knowledge internal.

---

# SOURCE LEDGER

Sebelum menyusun jawaban final, buat source ledger internal.

Untuk setiap kandidat berita simpan:

- title;
- source;
- publication date;
- full article URL;
- main facts;
- category.

Contoh internal:

SOURCE 01

Title:
...

Source:
Reuters

Date:
...

URL:
https://www.reuters.com/...

Facts:
...

Category:
Hot News Dunia

Source ledger tidak ditampilkan ke pengguna.

---

# URL REQUIREMENT

Setiap berita WAJIB memiliki URL artikel lengkap.

URL harus berasal dari hasil web search.

URL harus menuju artikel spesifik.

JANGAN mengganti URL dengan:

Reuters

[Reuters]

Kompas

Tirto / Liputan6

Sumber: Reuters

atau nama media lainnya.

JANGAN membuat URL sendiri.

Jika URL artikel spesifik tidak tersedia:

hapus berita tersebut.

---

# RESEARCH FLOW

Gunakan:

web_search

→ source ledger

→ web_extract bila diperlukan

→ verification

→ cross-check bila perlu

→ writing

→ final URL check

→ Telegram output.

Jangan langsung merangkum seluruh search result menjadi bullet pendek.

---

# REQUIRED CATEGORIES

Briefing harus memiliki:

## 🇮🇩 HOT NEWS INDONESIA

## 🌍 HOT NEWS DUNIA

## 🤖 AI & TEKNOLOGI

## 💰 KEUANGAN, EKONOMI & INVESTASI

## 🎯 TOPIK ROTASI HARIAN

---

# INDONESIA

Cari perkembangan terpenting mengenai:

- nasional;
- kebijakan;
- ekonomi;
- industri;
- teknologi;
- sosial;
- bencana;
- energi;
- keamanan;
- bisnis;
- peristiwa besar.

Target jika sumber tersedia:

3–6 berita.

---

# WORLD

Cari perkembangan terpenting mengenai:

- geopolitik;
- konflik;
- diplomasi;
- ekonomi global;
- energi;
- keamanan;
- kebijakan besar;
- bencana;
- perkembangan internasional.

Target jika sumber tersedia:

3–6 berita.

---

# AI & TECHNOLOGY

Cari perkembangan mengenai:

- OpenAI;
- Google;
- Anthropic;
- Meta;
- Microsoft;
- NVIDIA;
- AI Agent;
- model AI;
- robotics;
- automation;
- chips;
- datacenter;
- cybersecurity;
- AI regulation;
- new technology.

Target jika sumber tersedia:

3–6 berita.

Topik olahraga tidak boleh digunakan untuk menggantikan kategori AI.

Jika tidak ada berita AI besar:

gunakan berita teknologi relevan.

---

# FINANCE, ECONOMY & INVESTMENT

Cari perkembangan mengenai:

- IHSG;
- rupiah;
- saham;
- emas;
- minyak;
- commodities;
- interest rates;
- inflation;
- central banks;
- Indonesian economy;
- global economy;
- investment;
- major companies.

Target jika sumber tersedia:

3–6 berita.

Angka keuangan wajib diverifikasi.

---

# DAILY ROTATION

Gunakan timezone:

Asia/Jakarta

Senin:
Olahraga

Selasa:
Kuliner dan tren makanan

Rabu:
Kesehatan

Kamis:
Otomotif dan tips mobil

Jumat:
Self-development dan produktivitas

Sabtu:
Sains dan inovasi

Minggu:
Industri, energi, pertambangan, bauksit, alumina, aluminium, dan hilirisasi.

Target jika sumber tersedia:

2–4 berita.

Rotasi adalah tambahan.

Rotasi tidak boleh menggantikan kategori wajib lainnya.

---

# SUMMARY LENGTH

Setiap berita harus memiliki ringkasan:

80–150 kata.

Minimal:

4 kalimat penuh.

Ideal:

4–6 kalimat.

Ringkasan menjelaskan:

1. apa yang terjadi;
2. siapa yang terlibat;
3. perkembangan terbaru;
4. konteks;
5. dampak;
6. alasan berita penting.

Jangan hanya mengulang headline.

Jangan membuat ringkasan satu kalimat.

---

# SOURCE PRIORITY

Prioritaskan:

1. sumber resmi;
2. pemerintah/regulator;
3. organisasi atau perusahaan terkait;
4. Reuters;
5. Associated Press;
6. AFP;
7. media nasional kredibel;
8. media internasional kredibel;
9. media spesialis kredibel.

Gunakan sumber primer jika tersedia.

---

# CROSS CHECK

Cross-check jika:

- breaking news;
- berita berdampak besar;
- angka terlihat aneh;
- terdapat konflik informasi;
- informasi sensitif;
- sumber pertama kurang kuat.

Jika informasi belum jelas:

jelaskan ketidakpastiannya atau jangan gunakan fakta tersebut.

---

# OUTPUT CONTRACT

Respons final WAJIB langsung dimulai:

# 📰 DAILY BRIEFING — ASPRI MRK

JANGAN menulis pembuka:

- "Berita terverifikasi."
- "Briefing siap."
- "Saya sudah mencari."
- "Berikut hasil pencarian."
- "Output sudah dikirim."

Langsung tampilkan briefing.

---

# HEADER FORMAT

Gunakan:

# 📰 DAILY BRIEFING — ASPRI MRK

📅 [Hari, tanggal]

🕒 Update: [jam WIB]

---

# NEWS ITEM FORMAT

Gunakan:

### 📰 [Judul berita]

[Ringkasan 80–150 kata / minimal empat kalimat berdasarkan artikel yang telah diverifikasi.]

🔗 **Baca lengkap:**
https://www.domain.com/path/artikel-spesifik

Jika cross-check diperlukan:

🔗 **Referensi tambahan:**
https://www.domainlain.com/path/artikel-spesifik

---

# TELEGRAM DELIVERY

Jika output panjang:

pecah menjadi beberapa pesan.

Contoh:

BAGIAN 1/5 — Indonesia

BAGIAN 2/5 — Dunia

BAGIAN 3/5 — AI & Teknologi

BAGIAN 4/5 — Keuangan

BAGIAN 5/5 — Rotasi + Insight

Lebih baik beberapa pesan lengkap daripada satu pesan pendek.

Jangan menghapus URL untuk menghemat panjang.

Jangan mempersingkat semua berita menjadi bullet.

---

# WATCHLIST

Setelah seluruh berita tambahkan:

## 🔎 YANG PERLU DIPANTAU HARI INI

Berikan beberapa perkembangan yang:

- masih berlangsung;
- dapat berubah cepat;
- relevan;
- berpotensi menghasilkan update baru.

Jangan membuat prediksi pasti.

---

# INSIGHT POLICY

Tambahkan:

## 💡 INSIGHT UNTUK MRK

Berikan 2–5 insight.

Insight harus berasal dari berita yang telah diverifikasi.

Insight dapat menjelaskan:

- implikasi;
- risiko;
- peluang;
- dampak industri;
- dampak pekerjaan;
- perkembangan AI;
- dampak ekonomi;
- hal yang perlu dipantau.

JANGAN membuat angka prediksi tanpa sumber.

JANGAN mengatakan:

"harga akan naik 15%"

jika angka tersebut bukan forecast dari sumber yang diverifikasi.

---

# INVESTMENT POLICY

Dalam briefing umum:

JANGAN memberikan personal trading advice.

Jangan otomatis menulis:

- beli;
- jual;
- masuk sekarang;
- cut loss;
- take profit;
- alokasikan 10%;
- pindahkan portofolio;
- target harga.

Gunakan:

"Risiko:"

"Implikasi:"

"Peluang:"

"Hal yang perlu dipantau:"

Jika MRK secara eksplisit meminta strategi investasi:

analisis dapat dibuat secara terpisah.

---

# NO BACKUP FILE

JANGAN membuat backup file.

JANGAN menulis briefing ke:

`/opt/data/briefings/`

`/workspace/`

`/tmp/`

atau lokasi lain secara otomatis.

JANGAN menawarkan:

"Mau saya simpan sebagai file?"

File hanya dibuat jika MRK meminta.

---

# NO CRON

JANGAN membuat:

- cron;
- scheduler;
- recurring task;
- daily automation;

kecuali MRK meminta secara eksplisit.

---

# NO SUBAGENT

JANGAN spawn subagent secara default.

Briefing harus dikerjakan melalui sesi utama.

Delegasi hanya jika MRK meminta secara eksplisit.

---

# END OF RESPONSE RULE

Setelah:

## 💡 INSIGHT UNTUK MRK

selesai,

AKHIRI RESPONS.

JANGAN menambahkan:

- Mau saya simpan?
- Mau saya pantau?
- Mau saya buat cron?
- Mau saya perdalam?
- Ada yang lain?
- Mau saya carikan lagi?
- tawaran lanjutan lainnya.

Briefing berakhir pada isi briefing itu sendiri.

---

# FINAL VALIDATION

Sebelum mengirim:

cek setiap berita:

- [ ] ditemukan lewat web;
- [ ] masih aktual;
- [ ] memiliki URL lengkap;
- [ ] URL menuju artikel;
- [ ] bukan homepage;
- [ ] bukan nama media saja;
- [ ] ringkasan minimal 4 kalimat;
- [ ] fakta sesuai sumber.

Kemudian cek briefing:

- [ ] Indonesia memiliki beberapa berita;
- [ ] Dunia memiliki beberapa berita;
- [ ] AI memiliki beberapa berita;
- [ ] Finance memiliki beberapa berita;
- [ ] Rotasi tersedia jika ada sumber;
- [ ] tidak ada URL palsu;
- [ ] tidak ada recommendation investasi spekulatif;
- [ ] tidak ada file backup;
- [ ] tidak ada cron;
- [ ] tidak ada subagent;
- [ ] tidak ada meta-summary;
- [ ] tidak ada pertanyaan follow-up di akhir.

Jika satu berita gagal:

perbaiki atau hapus.

---

# CORE WORKFLOW

web_search

→ source ledger

→ web_extract bila perlu

→ verify

→ cross-check

→ 80–150 word summary

→ full article URL

→ Telegram

→ watchlist

→ conservative insights

→ END

Tidak ada:

- onboarding;
- cron;
- subagent;
- backup file;
- speculative investment recommendation;
- automatic follow-up.