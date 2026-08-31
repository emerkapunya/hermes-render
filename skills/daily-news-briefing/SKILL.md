---
name: daily-news-briefing
description: Membuat briefing berita terbaru dengan beberapa berita per kategori, riset ilmiah dan kimia, ringkasan minimal 50 kata, verifikasi web, tanggal aktual, dan URL artikel asli.
version: 7.0.0
author: MRK
---

# DAILY NEWS BRIEFING — ASPRI MRK

## PURPOSE

Gunakan skill ini ketika MRK meminta:

- briefing berita;
- briefing pagi;
- berita terbaru;
- hot news;
- breaking news;
- update berita;
- update AI;
- update teknologi;
- update ekonomi;
- update investasi;
- berita riset;
- penelitian terbaru;
- riset kimia terbaru.

Hasil utama harus langsung tampil dalam percakapan Telegram.

JANGAN membuat file secara default.

JANGAN membuat cron.

JANGAN menggunakan subagent secara default.

JANGAN memberikan meta-summary sebagai pengganti briefing.

---

# USER CONTEXT

MRK merupakan lulusan:

**Sarjana Kimia**

dan bekerja di bidang:

**Quality Control pada industri pengolahan bauksit menjadi alumina.**

Karena itu briefing harian harus memiliki kategori tetap:

**🧪 RISET ILMIAH & KIMIA**

Kategori tersebut muncul setiap hari.

---

# CURRENT DATE — WAJIB

Sebelum menentukan briefing:

1. Tentukan tanggal aktual.
2. Gunakan timezone `Asia/Jakarta`.
3. Tentukan nama hari dari tanggal tersebut.
4. Jangan menggunakan hari atau tanggal dari session lama.
5. Pastikan tanggal dan hari konsisten.
6. Tentukan rotasi berdasarkan hari aktual.

Jika tanggal aktual:

`1 September 2026`

maka hari:

`Selasa`

dan rotasi:

`Kuliner dan tren makanan`

JANGAN menebak nama hari.

---

# WEB SEARCH — WAJIB

Semua berita terkini harus menggunakan web.

Gunakan:

`web_search`

Jika tersedia dan diperlukan:

`web_extract`

Jangan menggunakan knowledge internal sebagai satu-satunya sumber
berita aktual.

---

# PROVIDER INDEPENDENCE

Jangan bergantung pada provider web tertentu.

Jangan mengunci skill ke:

- Tavily;
- Brave;
- DDGS;
- Exa;
- Firecrawl;
- provider tertentu.

Gunakan backend web yang tersedia melalui Hermes.

Jika backend pertama gagal:

coba fallback yang tersedia.

---

# SEARCH FAILURE

Jika web_search pertama gagal:

1. coba query yang lebih sederhana;
2. coba query alternatif;
3. coba kategori berbeda;
4. gunakan fallback backend jika tersedia.

Jika web benar-benar tidak tersedia:

BERHENTI.

Tampilkan:

`Web search saat ini tidak tersedia sehingga saya tidak akan membuat briefing yang belum terverifikasi.`

Jangan membuat berita dari internal knowledge.

---

# SOURCE LEDGER — WAJIB

Sebelum menulis briefing, buat source ledger internal.

Untuk setiap kandidat berita simpan:

- Title
- Source
- Publication date
- Full URL
- Main facts
- Category

Untuk scientific research tambahkan jika tersedia:

- Journal / Publisher
- Research institution
- DOI
- Research method
- Key finding

Contoh internal:

SOURCE 01

Title:
...

Source:
Nature Chemistry

Date:
...

URL:
https://www.nature.com/articles/...

DOI:
...

Facts:
...

Method:
...

Category:
Scientific Research & Chemistry

Source ledger tidak ditampilkan ke pengguna.

---

# URL REQUIREMENT

Setiap berita WAJIB memiliki URL artikel lengkap.

URL harus:

- berasal dari hasil web search;
- valid;
- spesifik;
- mengarah ke artikel atau sumber primer.

Tampilkan URL penuh.

Contoh BENAR:

🔗 **Baca lengkap:**
https://www.reuters.com/world/example-article/

Contoh BENAR untuk paper:

🔬 **Paper / sumber primer:**
https://pubs.acs.org/doi/10.xxxx/xxxxx

JANGAN menggunakan:

`Reuters`

`BBC`

`Nature`

`ACS`

`[Kompas]`

sebagai pengganti URL.

Jika URL spesifik tidak tersedia:

jangan masukkan item tersebut.

---

# URL VALIDATION

Sebelum digunakan:

cek URL:

- dimulai dengan http:// atau https://;
- berasal dari hasil tool;
- bukan hasil tebakan;
- relevan dengan judul;
- bukan homepage jika artikel spesifik tersedia.

Jangan membuat URL sendiri.

---

# REQUIRED CATEGORIES

Briefing WAJIB memiliki:

## 🇮🇩 HOT NEWS INDONESIA

## 🌍 HOT NEWS DUNIA

## 🤖 AI & TEKNOLOGI

## 💰 KEUANGAN, EKONOMI & INVESTASI

## 🧪 RISET ILMIAH & KIMIA

## 🎯 TOPIK ROTASI HARIAN

---

# TARGET NEWS COUNT

Jika sumber aktual tersedia:

Indonesia:
3–5 berita.

Dunia:
3–5 berita.

AI & Teknologi:
3–5 berita.

Keuangan/Ekonomi/Investasi:
3–5 berita.

Riset Ilmiah & Kimia:
2–4 berita.

Rotasi:
2–3 berita.

Jumlah bukan kewajiban mutlak.

Kualitas dan verifikasi lebih penting daripada jumlah.

---

# HOT NEWS INDONESIA

Prioritaskan:

- nasional;
- kebijakan;
- ekonomi;
- industri;
- energi;
- bencana;
- teknologi;
- sosial;
- keamanan;
- hukum;
- peristiwa besar.

---

# HOT NEWS DUNIA

Prioritaskan:

- geopolitik;
- konflik;
- diplomasi;
- ekonomi global;
- energi;
- kebijakan;
- bencana;
- peristiwa internasional besar.

---

# AI & TECHNOLOGY

Prioritaskan:

- OpenAI;
- Anthropic;
- Google;
- Meta;
- Microsoft;
- NVIDIA;
- AI Agent;
- model AI;
- automation;
- robotics;
- AI chips;
- datacenter;
- cybersecurity;
- AI regulation;
- scientific AI.

Jika tidak ada berita AI besar:

gunakan perkembangan teknologi lain yang relevan.

JANGAN menggunakan olahraga untuk menggantikan AI.

---

# FINANCE, ECONOMY & INVESTMENT

Prioritaskan:

- IHSG;
- rupiah;
- saham;
- emas;
- minyak;
- commodities;
- interest rate;
- inflation;
- central banks;
- Indonesian economy;
- global economy;
- major companies;
- investment.

Angka keuangan wajib diverifikasi.

---

# SCIENTIFIC RESEARCH & CHEMISTRY

Kategori ini WAJIB muncul setiap hari.

Cari perkembangan terbaru dalam:

- chemistry;
- analytical chemistry;
- inorganic chemistry;
- physical chemistry;
- materials chemistry;
- industrial chemistry;
- catalysis;
- electrochemistry;
- spectroscopy;
- chromatography;
- mass spectrometry;
- laboratory instrumentation;
- sensors;
- corrosion;
- surface chemistry;
- environmental chemistry;
- water chemistry;
- battery materials;
- critical minerals;
- mineral processing;
- hydrometallurgy;
- Bayer Process;
- bauxite;
- alumina;
- aluminium;
- process chemistry;
- analytical methods;
- chemometrics;
- laboratory automation.

---

# SCIENTIFIC SOURCE PRIORITY

Untuk riset ilmiah prioritaskan:

1. paper original;
2. journal publisher;
3. scientific society;
4. university;
5. research institution;
6. national laboratory;
7. official research press release;
8. media sains kredibel.

Contoh sumber yang dapat diprioritaskan jika relevan:

- ACS;
- RSC;
- Nature;
- Science;
- Wiley;
- Springer Nature;
- Elsevier;
- university journals;
- research institutes.

Jangan hanya mengandalkan artikel media populer jika paper asli tersedia.

---

# SCIENTIFIC ARTICLE FORMAT

Untuk setiap berita riset gunakan format:

### 🧪 [Judul penelitian / temuan]

[Ringkasan minimal 50 kata dan ideal 80–140 kata.]

Ringkasan harus menjelaskan bila tersedia:

- latar belakang masalah;
- apa yang diteliti;
- metode atau pendekatan utama;
- hasil utama;
- mengapa hasil tersebut penting;
- potensi aplikasi;
- relevansi dengan kimia, laboratorium, QC, atau industri.

Jika penelitian masih preliminary:

jelaskan bahwa hasil masih preliminary.

Jika penelitian hanya pada skala laboratorium:

jangan menyatakan seolah-olah sudah siap digunakan industri.

🔬 **Paper / sumber primer:**
https://...

Jika ada artikel penjelas:

🔗 **Artikel pendukung:**
https://...

---

# SCIENTIFIC INTERPRETATION POLICY

Jangan melebih-lebihkan hasil penelitian.

Bedakan:

**Temuan:**
apa yang benar-benar ditemukan.

**Potensi:**
apa yang mungkin dapat dilakukan.

**Keterbatasan:**
apa yang belum dibuktikan.

Jangan menggunakan kata:

- terbukti;
- revolusioner;
- game changer;
- pasti;
- akan menggantikan;

kecuali sumber mendukung klaim tersebut.

---

# DAILY ROTATION

Gunakan hari aktual Asia/Jakarta.

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
Industri, energi, pertambangan, bauksit, alumina, aluminium,
dan hilirisasi.

Kategori Riset Ilmiah & Kimia tetap ada pada hari Sabtu.

Rotasi Sabtu menjadi tambahan sains/inovasi yang lebih luas.

---

# SUMMARY LENGTH

Setiap berita biasa WAJIB memiliki ringkasan minimal:

**50 kata**

Target ideal:

**70–120 kata**

Setiap berita riset ilmiah ideal:

**80–140 kata**

Ringkasan harus berupa paragraf substantif.

Jangan hanya mengulang headline.

Jika kurang dari 50 kata:

perpanjang dengan fakta yang tersedia dari sumber.

Jangan menambahkan spekulasi hanya untuk menambah panjang.

---

# SOURCE PRIORITY — GENERAL NEWS

Prioritaskan:

1. sumber resmi;
2. pemerintah/regulator;
3. organisasi/perusahaan terkait;
4. Reuters;
5. Associated Press;
6. AFP;
7. media nasional kredibel;
8. media internasional kredibel;
9. media spesialis kredibel.

---

# CROSS-CHECK

Lakukan cross-check jika:

- breaking news;
- berita berdampak besar;
- angka ekstrem;
- informasi sensitif;
- konflik;
- pasar bergerak tajam;
- hasil riset terdengar luar biasa;
- sumber pertama kurang kuat.

Untuk klaim ilmiah besar:

usahakan cek sumber primer.

---

# OUTPUT CONTRACT

Respons final harus langsung dimulai dengan:

# 📰 DAILY BRIEFING — ASPRI MRK

JANGAN memulai dengan:

- Skill loaded.
- Sedang melakukan web search.
- Saya akan mencari berita.
- Berita terverifikasi.
- Briefing siap.
- Output sudah dikirim.

Langsung tampilkan hasil.

---

# HEADER

Gunakan:

# 📰 DAILY BRIEFING — ASPRI MRK

📅 [Hari benar], [Tanggal aktual]

🕒 Update: [jam WIB jika tersedia]

---

# GENERAL NEWS ITEM FORMAT

### 📰 [Judul berita]

[Ringkasan minimal 50 kata.]

🔗 **Baca lengkap:**
https://www.domain.com/path/artikel-spesifik

Jika cross-check penting:

🔗 **Referensi tambahan:**
https://...

---

# SCIENTIFIC NEWS ITEM FORMAT

### 🧪 [Judul riset]

[Ringkasan 80–140 kata bila informasi tersedia.]

🔬 **Paper / sumber primer:**
https://...

Jika tersedia:

🔗 **Artikel pendukung:**
https://...

---

# TELEGRAM DELIVERY

Jika briefing terlalu panjang:

pecah menjadi beberapa pesan.

Contoh:

BAGIAN 1/6 — Indonesia

BAGIAN 2/6 — Dunia

BAGIAN 3/6 — AI & Teknologi

BAGIAN 4/6 — Keuangan

BAGIAN 5/6 — Riset Ilmiah & Kimia

BAGIAN 6/6 — Rotasi + Watchlist + Insight

Lebih baik beberapa pesan lengkap daripada satu pesan yang terlalu
dipadatkan.

Jangan menghilangkan URL.

Jangan mempersingkat semua item menjadi headline saja.

---

# WATCHLIST

Tambahkan:

## 🔎 YANG PERLU DIPANTAU HARI INI

Berikan perkembangan yang:

- masih berlangsung;
- dapat berubah cepat;
- memiliki potensi update;
- relevan dengan keseluruhan briefing.

Gunakan bahasa faktual.

---

# INSIGHT FOR MRK

Tambahkan:

## 💡 INSIGHT UNTUK MRK

Berikan 2–5 insight.

Insight dapat mencakup:

- Implikasi industri;
- Risiko;
- Peluang;
- Relevansi QC;
- Relevansi laboratorium;
- Relevansi kimia;
- Relevansi AI/otomasi;
- Hal yang perlu dipantau.

Jika ada riset yang relevan dengan pekerjaan MRK:

jelaskan potensi keterkaitannya dengan:

- analytical method;
- laboratory QC;
- process control;
- bauxite/alumina;
- industrial chemistry.

Jangan menyatakan bahwa teknologi siap digunakan jika paper belum
membuktikannya.

---

# INVESTMENT POLICY

Dalam briefing umum:

JANGAN memberikan instruksi transaksi personal.

Jangan otomatis menulis:

- beli;
- jual;
- take profit;
- cut loss;
- alokasikan sekian persen;
- target harga.

Gunakan analisis:

- risiko;
- implikasi;
- faktor penggerak;
- hal yang perlu dipantau.

---

# NO BACKUP FILE

JANGAN membuat backup file.

JANGAN menyimpan briefing otomatis.

JANGAN menawarkan:

`Mau saya simpan sebagai file?`

File hanya dibuat jika MRK secara eksplisit meminta.

---

# NO CRON

JANGAN membuat:

- cron;
- scheduler;
- recurring task;

kecuali MRK secara eksplisit meminta.

---

# NO SUBAGENT

Jangan spawn subagent secara default.

Briefing dilakukan melalui main session.

---

# END RULE

Setelah:

## 💡 INSIGHT UNTUK MRK

selesai:

AKHIRI RESPONS.

JANGAN menambahkan:

- Mau saya simpan?
- Mau saya pantau?
- Mau saya buat cron?
- Mau saya perdalam?
- Mau saya carikan lagi?
- Ada lagi?

---

# FINAL VALIDATION

Untuk setiap berita cek:

- [ ] URL lengkap tersedia.
- [ ] URL berasal dari web search.
- [ ] URL menuju artikel spesifik.
- [ ] Ringkasan minimal 50 kata.
- [ ] Fakta sesuai sumber.
- [ ] Tanggal relevan.

Untuk scientific research cek:

- [ ] sumber primer dicari;
- [ ] metode dijelaskan jika tersedia;
- [ ] key finding jelas;
- [ ] aplikasi tidak dilebih-lebihkan;
- [ ] limitation disebut jika penting.

Untuk keseluruhan briefing cek:

- [ ] tanggal aktual benar;
- [ ] nama hari benar;
- [ ] rotasi benar;
- [ ] Indonesia tersedia;
- [ ] Dunia tersedia;
- [ ] AI tersedia;
- [ ] Finance tersedia;
- [ ] Riset Ilmiah & Kimia tersedia;
- [ ] Rotasi tersedia;
- [ ] tidak ada URL palsu;
- [ ] tidak ada nama media sebagai pengganti URL;
- [ ] tidak ada onboarding;
- [ ] tidak ada file offer;
- [ ] tidak ada speculative investment recommendation.

Jika checklist gagal:

perbaiki sebelum mengirim.

---

# CORE WORKFLOW

current date verification

→ web_search

→ source ledger

→ source / paper validation

→ web_extract bila diperlukan

→ cross-check

→ write substantive summary

→ full URL

→ Telegram

→ scientific research section

→ watchlist

→ conservative insight

→ END
