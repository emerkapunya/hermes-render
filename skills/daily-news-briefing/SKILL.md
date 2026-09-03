---
name: daily-news-briefing
description: Membuat Daily Briefing aktual untuk MRK dengan berita Indonesia, dunia, AI, ekonomi, riset ilmiah/kimia, dan topik rotasi harian.
version: 8.0.0
---

# DAILY NEWS BRIEFING — ASPRI MRK

## PURPOSE

Skill ini membuat briefing berita terbaru untuk MRK.

Output harus:

- aktual;
- terverifikasi;
- substantif;
- mudah dibaca;
- relevan;
- menggunakan Bahasa Indonesia;
- memiliki sumber langsung.

Skill ini digunakan secara manual.

JANGAN membuat cron otomatis.

JANGAN menggunakan subagent secara default.

JANGAN membuat file backup secara default.

Output langsung ke chat / Telegram.

---

# TRIGGERS

Aktifkan skill jika pengguna mengatakan:

- `🔥 Daily Briefing`
- `Daily Briefing`
- `daily briefing`
- `buat daily briefing`
- `briefing berita`
- `briefing pagi`
- `berita terbaru`
- `buat briefing berita terbaru`

Jika trigger berasal dari Telegram button:

`🔥 Daily Briefing`

perlakukan persis sebagai:

`buat daily briefing`

Jangan tampilkan menu lagi sebelum tugas selesai.

---

# DATE & TIME — HARD RULE

Timezone:

`Asia/Jakarta`

Sebelum melakukan pencarian:

1. tentukan tanggal aktual;
2. tentukan nama hari aktual;
3. pastikan tanggal dan hari konsisten;
4. tentukan kategori rotasi berdasarkan hari.

JANGAN menggunakan tanggal dari session lama.

JANGAN menebak nama hari.

Jika runtime/system time tersedia, gunakan itu.

---

# DAILY ROTATION

Topik rotasi berdasarkan hari:

- Senin → Olahraga
- Selasa → Kuliner & Tren Makanan
- Rabu → Kesehatan
- Kamis → Otomotif & Tips Mobil
- Jumat → Self-development & Produktivitas
- Sabtu → Sains & Inovasi
- Minggu → Industri, Energi, Pertambangan, Bauksit, Alumina, Aluminium & Hilirisasi

Kategori:

`Riset Ilmiah & Kimia`

tetap muncul setiap hari.

---

# REQUIRED CATEGORIES

Daily Briefing wajib memiliki:

1. 🇮🇩 Hot News Indonesia
2. 🌍 Hot News Dunia
3. 🤖 AI & Teknologi
4. 💰 Keuangan, Ekonomi & Investasi
5. 🧪 Riset Ilmiah & Kimia
6. 🔄 Topik Rotasi Harian

Jangan menghilangkan kategori tanpa alasan kuat.

---

# WEB SEARCH — REQUIRED

Daily Briefing WAJIB menggunakan web search aktual.

Jangan membuat briefing hanya dari knowledge internal.

Untuk setiap berita:

- gunakan hasil pencarian aktual;
- prioritaskan sumber yang terpercaya;
- ambil URL artikel spesifik;
- jangan membuat URL;
- jangan mengarang detail yang tidak ada di sumber.

Jika web search tersedia:

gunakan.

Jika web search gagal total:

JANGAN membuat berita dari ingatan.

Gunakan pesan:

`⚠️ Daily Briefing tidak dapat dibuat dengan aman karena web search gagal atau sumber aktual tidak tersedia. Saya tidak akan mengarang berita.`

---

# SOURCE PRIORITY

## Berita Umum

Prioritaskan:

- media nasional/internasional terpercaya;
- kantor berita;
- official company blog untuk pengumuman perusahaan;
- regulator;
- lembaga pemerintah;
- organisasi resmi.

Contoh:

- Reuters
- AP
- Bloomberg
- CNBC
- BBC
- ANTARA
- Kompas
- Tempo
- Katadata
- CNBC Indonesia
- Google Blog
- Microsoft Blog
- OpenAI
- NVIDIA
- perusahaan terkait
- regulator / kementerian / lembaga resmi

---

# SCIENTIFIC SOURCE PRIORITY

Untuk kategori:

`🧪 Riset Ilmiah & Kimia`

prioritaskan:

1. paper asli;
2. publisher jurnal;
3. DOI;
4. universitas;
5. research institution;
6. scientific society;
7. preprint jika memang relevan dan diberi konteks.

Hindari hanya menggunakan artikel media sekunder jika primary source tersedia.

Sumber ideal:

- Nature
- Science
- ACS
- RSC
- Wiley
- Elsevier
- Springer
- university research pages
- research institutes
- arXiv jika sesuai
- publisher jurnal resmi

---

# SCIENTIFIC TOPICS OF INTEREST

Prioritaskan jika tersedia:

- analytical chemistry;
- materials chemistry;
- inorganic chemistry;
- physical chemistry;
- industrial chemistry;
- catalysis;
- electrochemistry;
- spectroscopy;
- chromatography;
- mass spectrometry;
- laboratory instrumentation;
- analytical methods;
- sample preparation;
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
- chemometrics;
- sensors;
- laboratory automation.

---

# SOURCE LEDGER

Sebelum menulis output final, buat source ledger internal.

Untuk setiap kandidat berita catat:

- title;
- source;
- date;
- URL;
- key facts;
- relevance;
- category.

Untuk scientific item jika tersedia:

- paper title;
- journal;
- DOI;
- research institution;
- methodology;
- key finding;
- limitation.

Jangan tampilkan source ledger internal secara mentah.

Gunakan untuk verifikasi.

---

# LANGUAGE POLICY — HARD RULE

Bahasa output Daily Briefing adalah:

**BAHASA INDONESIA**

Seluruh narasi wajib ditulis dalam Bahasa Indonesia.

Termasuk:

- judul berita;
- ringkasan;
- penjelasan;
- konteks;
- analisis;
- insight;
- risiko;
- peluang;
- watchlist;
- interpretasi paper;
- penjelasan ekonomi.

Sumber boleh berasal dari bahasa apa pun.

Jika sumber menggunakan:

- English;
- Chinese;
- Russian;
- Japanese;
- Korean;
- Arabic;
- atau bahasa lain;

pahami sumber kemudian TULIS ULANG seluruh narasi dalam Bahasa Indonesia.

JANGAN meneruskan token atau fragmen bahasa asing ke dalam paragraf.

---

# FOREIGN LANGUAGE LEAKAGE — FORBIDDEN

Contoh output yang DILARANG:

`Dell сообщил hasil kuartalan yang превысил ожидания pasar.`

`Rupiah melemah ke уровень Rp17.700.`

`Investor khawatir terhadap 泡沫 sektor AI.`

`Текущий контекст memerlukan monitoring.`

Semua harus ditulis ulang.

Contoh benar:

`Dell melaporkan hasil kuartalan yang melampaui ekspektasi pasar.`

`Rupiah melemah ke sekitar Rp17.700 per dolar AS.`

`Investor khawatir terhadap potensi gelembung valuasi di sektor AI.`

`Kondisi saat ini memerlukan pemantauan lebih lanjut.`

---

# ALLOWED FOREIGN TERMS

Foreign terms hanya boleh dipertahankan jika merupakan:

- nama orang;
- nama perusahaan;
- nama produk;
- nama model;
- ticker;
- nama jurnal;
- judul paper;
- DOI;
- nama metode;
- istilah ilmiah;
- istilah teknis yang memang lazim.

Contoh:

- Dell Technologies
- NVIDIA
- OpenAI
- Gemini
- S&P 500
- US Treasury
- ICP-OES
- ICP-MS
- XRF
- XRD
- chemometrics
- Bayer Process

Kalimat penjelas tetap Bahasa Indonesia.

---

# SCRIPT VALIDATION

Sebelum output dikirim:

cek apakah narasi mengandung:

- Cyrillic;
- Hanzi yang tidak diperlukan;
- Kana/Kanji Jepang yang tidak diperlukan;
- Hangul;
- aksara Arab;
- foreign-language fragments.

Jika ditemukan dan bukan proper noun/technical term:

VALIDATION GAGAL.

Tulis ulang paragraf tersebut.

---

# INDONESIAN REWRITE PASS — REQUIRED

Setelah seluruh briefing selesai disusun:

1. baca ulang semua paragraf;
2. cari foreign-language leakage;
3. terjemahkan fragmen asing;
4. tulis ulang kalimat supaya natural;
5. cek grammar Bahasa Indonesia;
6. baru kirim.

Jangan hanya menghapus kata asing.

---

# SUMMARY LENGTH

Untuk berita umum:

minimum sekitar:

**50 kata per item**

Target ideal:

**70–120 kata per item**

Untuk Riset Ilmiah & Kimia:

minimum sekitar:

**60 kata per item**

Target ideal:

**80–140 kata per item**

Jika sumber tidak cukup kaya, jangan mengarang untuk mengejar panjang.

Lebih baik ringkas tetapi akurat daripada mengarang.

Namun jangan menulis hanya 1–2 kalimat pendek.

---

# ITEM COUNTS

Target:

## Hot News Indonesia

3–5 item

## Hot News Dunia

3–5 item

## AI & Teknologi

3–5 item

## Keuangan, Ekonomi & Investasi

3–5 item

## Riset Ilmiah & Kimia

2–4 item

## Rotasi Harian

2–3 item

Jika benar-benar tidak tersedia cukup sumber berkualitas, jumlah boleh berkurang.

Jangan membuat berita palsu untuk memenuhi kuota.

---

# NEWS ITEM FORMAT

Gunakan format:

`📰 Judul Berita`

Ringkasan 50+ kata dalam Bahasa Indonesia.

`🔗 Baca lengkap:`

`https://alamat-artikel-spesifik`

---

# URL POLICY — HARD RULE

Setiap item berita wajib memiliki:

URL artikel spesifik.

JANGAN hanya menulis:

`Reuters`

`Kompas`

`BBC`

atau nama media tanpa URL.

JANGAN membuat URL.

Gunakan URL dari hasil web search.

URL harus dimulai dengan:

`https://`

atau:

`http://`

Jika URL tidak tersedia:

jangan tampilkan item tersebut sebagai berita terverifikasi.

---

# SCIENTIFIC ITEM FORMAT

Untuk item ilmiah gunakan format:

`🧪 Judul Riset`

Jelaskan secara natural:

- masalah / latar belakang;
- metode atau pendekatan;
- temuan utama;
- makna hasil;
- potensi aplikasi;
- limitation jika tersedia;
- relevansi ke QC/laboratorium/industri bila relevan.

Kemudian:

`🔗 Sumber:`

URL paper/publisher/research institution.

Jika DOI tersedia, boleh ditambahkan.

---

# NO PLACEHOLDERS

JANGAN menggunakan placeholder seperti:

- `(singkat)`
- `dapat disesuaikan`
- `pantau perkembangan`
- `tidak ada terobosan besar`
- `fokus hari ini`
- `berita akan dilengkapi`

jika kategori seharusnya diisi dengan hasil riset aktual.

Jika tidak ada berita berkualitas:

jelaskan secara singkat bahwa tidak ditemukan kandidat kuat.

Jangan membuat isi generik.

---

# FACTUALITY RULES

Bedakan:

FACT:
informasi yang memang ada pada sumber.

INTERPRETATION:
makna atau implikasi yang wajar.

SPECULATION:
jangan ditulis sebagai fakta.

Untuk ekonomi:

jangan membuat angka, support/resistance, target harga, atau yield tanpa sumber.

Untuk scientific research:

jangan mengubah:

- correlation menjadi causation;
- preliminary finding menjadi final conclusion;
- potential application menjadi proven application.

---

# FINANCE SAFETY

Dalam Daily Briefing umum:

JANGAN memberikan personal trading advice.

Hindari:

- beli sekarang;
- jual sekarang;
- alokasi sekian persen;
- cut loss;
- take profit;
- target harga pasti.

Gunakan:

- faktor penggerak;
- risiko;
- peluang;
- implikasi;
- hal yang perlu dipantau.

---

# TELEGRAM OUTPUT

Output harus langsung tampil di chat.

Jika terlalu panjang:

pecah menjadi beberapa bagian:

`BAGIAN 1/6`

`BAGIAN 2/6`

dan seterusnya.

JANGAN mengurangi isi hanya untuk muat satu pesan.

---

# OUTPUT STRUCTURE

Gunakan:

`📅 DAILY BRIEFING — [Hari, Tanggal]`

`WIB • Asia/Jakarta`

Kemudian:

`BAGIAN 1/6 — 🇮🇩 HOT NEWS INDONESIA`

isi berita.

Lanjut:

`BAGIAN 2/6 — 🌍 HOT NEWS DUNIA`

Lanjut:

`BAGIAN 3/6 — 🤖 AI & TEKNOLOGI`

Lanjut:

`BAGIAN 4/6 — 💰 KEUANGAN, EKONOMI & INVESTASI`

Lanjut:

`BAGIAN 5/6 — 🧪 RISET ILMIAH & KIMIA`

Lanjut:

`BAGIAN 6/6 — 🔄 TOPIK ROTASI HARI INI`

---

# FINAL INSIGHT

Akhiri dengan:

`💡 INSIGHT UNTUK MRK`

Buat insight ringkas dan konservatif.

Insight harus:

- berbasis pada berita yang sudah disebutkan;
- tidak spekulatif berlebihan;
- tidak menjadi personal buy/sell advice;
- bila relevan hubungkan dengan QC, teknologi, sains, atau industri.

---

# NO FOLLOW-UP

Setelah:

`💡 INSIGHT UNTUK MRK`

SELESAI.

JANGAN menambahkan:

- `mau saya simpan?`
- `mau saya buat versi PDF?`
- `mau saya lanjutkan?`
- `mau kategori tertentu diperluas?`
- `ada lagi?`

---

# FINAL VALIDATION CHECKLIST

Sebelum kirim pastikan:

- [ ] tanggal aktual benar;
- [ ] nama hari benar;
- [ ] rotasi harian benar;
- [ ] web search digunakan;
- [ ] sumber aktual digunakan;
- [ ] setiap item memiliki URL spesifik;
- [ ] URL tidak dibuat;
- [ ] ringkasan minimal sekitar 50 kata;
- [ ] kategori Riset Ilmiah & Kimia ada;
- [ ] sumber primer diprioritaskan untuk riset;
- [ ] seluruh narasi Bahasa Indonesia;
- [ ] tidak ada Cyrillic;
- [ ] tidak ada Hanzi acak;
- [ ] tidak ada foreign-language leakage;
- [ ] tidak ada placeholder;
- [ ] tidak ada personal trading advice;
- [ ] output langsung ke chat;
- [ ] tidak membuat file otomatis;
- [ ] tidak membuat cron;
- [ ] tidak menambahkan follow-up.

Jika salah satu poin penting gagal:

perbaiki sebelum mengirim.

Jika tidak dapat diperbaiki:

jangan mengarang.
