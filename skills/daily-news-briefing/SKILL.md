---
name: daily-news-briefing
description: Membuat Daily Briefing aktual untuk MRK dengan berita Indonesia, dunia, AI, ekonomi, riset ilmiah & kimia, serta topik rotasi harian.
version: 9.0.0
---

# DAILY NEWS BRIEFING — ASPRI MRK

## PURPOSE

Skill ini membuat Daily Briefing aktual, terverifikasi, substantif, dan mudah dibaca untuk MRK.

Output harus:

- menggunakan Bahasa Indonesia;
- berdasarkan web search aktual;
- memiliki sumber langsung;
- memiliki URL artikel spesifik;
- memiliki ringkasan substantif;
- relevan dengan minat MRK;
- tidak mengarang;
- tidak menggunakan placeholder;
- tidak mencampurkan bahasa asing secara acak.

Skill ini digunakan secara manual.

JANGAN membuat cron otomatis.

JANGAN menggunakan subagent secara default.

JANGAN membuat file backup secara default.

Output langsung ke chat atau Telegram.

---

# TRIGGERS

Aktifkan skill ini jika pengguna mengatakan:

- `🔥 Daily Briefing`
- `Daily Briefing`
- `daily briefing`
- `buat daily briefing`
- `briefing berita`
- `briefing pagi`
- `berita terbaru`
- `buat briefing berita terbaru`

Jika trigger berasal dari tombol Telegram:

`🔥 Daily Briefing`

perlakukan persis sebagai:

`buat daily briefing`

JANGAN tampilkan menu lagi sebelum briefing selesai.

---

# DATE & TIME — HARD RULE

Timezone utama:

`Asia/Jakarta`

Sebelum melakukan pencarian:

1. tentukan tanggal aktual;
2. tentukan nama hari aktual;
3. pastikan tanggal dan hari konsisten;
4. tentukan kategori rotasi berdasarkan hari aktual.

JANGAN menggunakan tanggal dari session lama.

JANGAN menebak nama hari.

Jika runtime/system clock tersedia, gunakan itu.

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

`🧪 Riset Ilmiah & Kimia`

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

# TARGET ITEM COUNTS

Target jumlah item:

## 🇮🇩 Hot News Indonesia
3–5 item

## 🌍 Hot News Dunia
3–5 item

## 🤖 AI & Teknologi
3–5 item

## 💰 Keuangan, Ekonomi & Investasi
3–5 item

## 🧪 Riset Ilmiah & Kimia
2–4 item

## 🔄 Topik Rotasi Harian
2–3 item

Jika sumber berkualitas tidak cukup, jumlah boleh lebih sedikit.

JANGAN membuat berita palsu hanya untuk memenuhi target jumlah.

---

# WEB SEARCH — REQUIRED

Daily Briefing WAJIB menggunakan web search aktual.

Jangan membuat briefing hanya dari knowledge internal.

Untuk setiap berita:

- gunakan hasil pencarian aktual;
- prioritaskan sumber terpercaya;
- ambil URL artikel spesifik;
- verifikasi tanggal publikasi;
- gunakan fakta yang benar-benar ada di sumber;
- jangan mengarang detail tambahan.

Jika web search gagal total:

JANGAN membuat berita dari ingatan.

Gunakan pesan:

`⚠️ Daily Briefing tidak dapat dibuat dengan aman karena web search gagal atau sumber aktual tidak tersedia. Saya tidak akan mengarang berita.`

---

# SOURCE PRIORITY — GENERAL NEWS

Prioritaskan:

- kantor berita terpercaya;
- media nasional terpercaya;
- media internasional terpercaya;
- regulator;
- lembaga pemerintah;
- organisasi resmi;
- official company blog;
- official press release.

Contoh sumber yang dapat diprioritaskan:

- Reuters
- Associated Press
- BBC
- Bloomberg
- CNBC
- ANTARA
- Kompas
- Tempo
- Katadata
- CNBC Indonesia
- Google Blog
- Microsoft Blog
- OpenAI
- NVIDIA
- regulator
- kementerian
- lembaga resmi

Gunakan sumber yang paling dekat dengan fakta primer jika tersedia.

---

# SCIENTIFIC SOURCE PRIORITY

Untuk kategori:

`🧪 Riset Ilmiah & Kimia`

prioritas sumber:

1. paper asli;
2. publisher jurnal;
3. DOI;
4. university research page;
5. research institution;
6. scientific society;
7. preprint jika relevan dan diberi konteks.

Jika primary source tersedia, jangan hanya mengandalkan artikel media sekunder.

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

Prioritaskan penelitian terkait:

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

# SOURCE LEDGER — INTERNAL REQUIRED STEP

Sebelum menulis output final, buat source ledger internal.

Untuk setiap kandidat berita catat:

- category;
- title;
- source;
- publication date;
- URL;
- key facts;
- relevance;
- apakah URL spesifik;
- apakah informasi cukup untuk ringkasan minimum.

Untuk scientific item jika tersedia catat juga:

- paper title;
- journal;
- DOI;
- research institution;
- methodology;
- key finding;
- limitation;
- potential application.

Jangan tampilkan source ledger internal secara mentah.

Gunakan ledger untuk validasi.

---

# LANGUAGE POLICY — HARD RULE

Bahasa output Daily Briefing adalah:

**BAHASA INDONESIA**

Seluruh narasi wajib ditulis dalam Bahasa Indonesia.

Termasuk:

- judul berita;
- ringkasan;
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

pahami sumber tersebut lalu TULIS ULANG dalam Bahasa Indonesia.

JANGAN meneruskan token bahasa asing secara acak ke dalam narasi.

---

# FOREIGN LANGUAGE LEAKAGE — FORBIDDEN

Contoh yang DILARANG:

`Dell сообщил hasil kuartalan yang превысил ekspektasi.`

`Rupiah melemah ke уровень Rp17.700.`

`Investor khawatir terhadap 泡沫 sektor AI.`

`Текущий контекст memerlukan monitoring.`

Semua harus ditulis ulang menjadi Bahasa Indonesia yang natural.

Contoh benar:

`Dell melaporkan hasil kuartalan yang melampaui ekspektasi pasar.`

`Rupiah melemah ke sekitar Rp17.700 per dolar AS.`

`Investor khawatir terhadap potensi gelembung valuasi di sektor AI.`

`Kondisi saat ini memerlukan pemantauan lebih lanjut.`

---

# ALLOWED FOREIGN TERMS

Foreign terms boleh dipertahankan hanya jika merupakan:

- nama orang;
- nama perusahaan;
- nama produk;
- nama model AI;
- ticker saham;
- nama jurnal;
- judul paper;
- DOI;
- nama metode;
- istilah ilmiah;
- istilah teknis yang lazim.

Contoh:

- OpenAI
- NVIDIA
- Dell Technologies
- Gemini
- S&P 500
- US Treasury
- ICP-OES
- ICP-MS
- XRF
- XRD
- chemometrics
- Bayer Process

Kalimat di sekitarnya tetap Bahasa Indonesia.

---

# INDONESIAN REWRITE PASS — REQUIRED

Setelah seluruh briefing disusun:

1. baca ulang semua paragraf;
2. cari foreign-language leakage;
3. terjemahkan fragmen asing;
4. tulis ulang kalimat supaya natural;
5. cek grammar Bahasa Indonesia;
6. pastikan tidak ada potongan bahasa Rusia, Mandarin, Jepang, Korea, Arab, atau bahasa asing lain yang tidak diperlukan;
7. baru kirim.

Jangan hanya menghapus token asing.

Tulis ulang paragraf secara natural.

---

# ITEM COMPLETENESS — HARD GATE

Setiap item berita dianggap VALID hanya jika SEMUA syarat berikut terpenuhi:

1. memiliki judul;
2. memiliki ringkasan minimum sesuai aturan;
3. memiliki URL artikel spesifik;
4. URL berasal dari hasil web search aktual;
5. isi ringkasan sesuai sumber;
6. narasi menggunakan Bahasa Indonesia;
7. bukan placeholder;
8. bukan generalisasi tanpa sumber.

Jika salah satu syarat gagal:

JANGAN kirim item tersebut.

Cari sumber lain atau hapus item tersebut.

---

# WORD COUNT — STRICT

## Berita umum

Minimum absolut:

**50 kata per item**

Target ideal:

**70–120 kata per item**

## Riset Ilmiah & Kimia

Minimum absolut:

**60 kata per item**

Target ideal:

**80–140 kata per item**

Sebelum final output:

periksa setiap ringkasan.

Jika berita umum kurang dari 50 kata:

JANGAN kirim.

Perluas menggunakan informasi yang benar-benar didukung sumber.

Jika riset ilmiah kurang dari 60 kata:

JANGAN kirim.

Perluas menggunakan metode, temuan, makna, limitation, atau aplikasi yang benar-benar tersedia di sumber.

JANGAN menambahkan kalimat generik hanya untuk memenuhi jumlah kata.

Jika sumber tidak cukup kaya:

ganti sumber atau ganti berita.

---

# SOURCE URL — HARD RULE

Setiap item berita wajib memiliki URL artikel spesifik.

Format:

`🔗 Baca lengkap:`

`https://alamat-artikel-spesifik`

Contoh benar:

`https://www.reuters.com/world/...`

Contoh salah:

`Reuters`

`Google`

`Nature`

`Sumber: media internasional`

`lihat hasil pencarian`

Untuk scientific item boleh gunakan:

- DOI URL;
- journal article URL;
- publisher URL;
- university research page;
- research institution page.

Jika URL artikel spesifik tidak tersedia:

item tersebut TIDAK BOLEH dimasukkan.

---

# NO SOURCELESS ITEM

Format seperti ini DILARANG:

`1. Oil Prices Rise Due to Middle East Tensions`

diikuti satu atau dua kalimat tanpa URL.

Format seperti ini juga DILARANG:

`New Carbon Material for Cheaper Carbon Capture`

tanpa sumber.

Setiap item harus memiliki ringkasan lengkap dan URL spesifik.

---

# NO SHORT BULLET BRIEFING

Format seperti ini DILARANG:

- Indonesia: kebakaran hutan, beras, reforma agraria
- Internasional: konflik Timur Tengah dan pasar
- AI: investasi AI meningkat
- Kimia: katalis baru ditemukan

Ini bukan Daily Briefing yang valid.

Setiap berita harus menjadi item terpisah dengan:

- judul;
- ringkasan;
- URL.

---

# ROTATION CATEGORY — HARD RULE

Topik Rotasi Harian juga wajib mengikuti aturan item normal.

Setiap item rotasi wajib memiliki:

- judul;
- ringkasan minimal 50 kata;
- URL spesifik;
- Bahasa Indonesia.

JANGAN menulis:

`Indonesia: Borneo wildfires response, national rice seed rollout, and agrarian reform progress.`

Pisahkan menjadi berita lengkap.

---

# NEWS ITEM FORMAT

Gunakan format:

`📰 Judul Berita dalam Bahasa Indonesia`

Ringkasan minimal 50 kata.

Ringkasan harus memuat:

- fakta utama;
- konteks penting;
- angka atau detail relevan jika tersedia;
- dampak atau implikasi yang wajar.

Kemudian:

`🔗 Baca lengkap:`

`https://alamat-artikel-spesifik`

---

# SCIENTIFIC ITEM COMPLETENESS

Setiap item Riset Ilmiah & Kimia wajib memiliki:

- judul riset;
- ringkasan minimal 60 kata;
- sumber primer jika tersedia;
- metode atau pendekatan;
- temuan utama;
- arti penting;
- potensi aplikasi;
- limitation jika tersedia;
- relevansi ke QC/laboratorium/industri jika relevan;
- URL spesifik.

Jika tersedia, tambahkan DOI.

---

# SCIENTIFIC ITEM FORMAT

Gunakan:

`🧪 Judul Riset`

Ringkasan 60+ kata dalam Bahasa Indonesia.

Jika informasi tersedia, jelaskan:

- masalah atau latar belakang;
- metode;
- hasil utama;
- arti hasil;
- potensi aplikasi;
- limitation;
- relevansi industri/laboratorium.

Kemudian:

`🔗 Sumber:`

`https://alamat-paper-atau-publisher`

Jika tersedia:

`DOI: https://doi.org/...`

---

# NO PLACEHOLDERS

JANGAN menggunakan:

- `(singkat)`
- `dapat disesuaikan`
- `pantau perkembangan`
- `tidak ada terobosan besar`
- `fokus hari ini`
- `berita akan dilengkapi`
- `sumber langsung di hasil pencarian`
- `lihat web search`
- `ringkasan sementara`

Jika tidak menemukan berita berkualitas:

lebih baik kurangi jumlah item.

Jangan isi dengan konten generik.

---

# FACTUALITY RULES

Bedakan:

FACT:
informasi yang memang dilaporkan sumber.

INTERPRETATION:
makna atau implikasi yang wajar.

SPECULATION:
jangan ditulis sebagai fakta.

Untuk ekonomi dan pasar:

jangan membuat:

- support;
- resistance;
- target harga;
- yield;
- persentase;
- forecast;

tanpa sumber.

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

pecah menjadi beberapa pesan.

Gunakan penanda:

`BAGIAN 1/6`

`BAGIAN 2/6`

dan seterusnya.

JANGAN menurunkan jumlah kata hanya agar muat dalam satu pesan.

JANGAN menghapus URL untuk menghemat panjang.

JANGAN mengganti berita lengkap menjadi bullet singkat.

---

# OUTPUT STRUCTURE

Gunakan struktur:

`📅 DAILY BRIEFING — [Hari, Tanggal]`

`WIB • Asia/Jakarta`

---

`BAGIAN 1/6 — 🇮🇩 HOT NEWS INDONESIA`

Berita lengkap.

---

`BAGIAN 2/6 — 🌍 HOT NEWS DUNIA`

Berita lengkap.

---

`BAGIAN 3/6 — 🤖 AI & TEKNOLOGI`

Berita lengkap.

---

`BAGIAN 4/6 — 💰 KEUANGAN, EKONOMI & INVESTASI`

Berita lengkap.

---

`BAGIAN 5/6 — 🧪 RISET ILMIAH & KIMIA`

Riset lengkap.

---

`BAGIAN 6/6 — 🔄 TOPIK ROTASI HARI INI`

Berita lengkap.

---

# FINAL INSIGHT

Akhiri dengan:

`💡 INSIGHT UNTUK MRK`

Insight harus:

- menggunakan Bahasa Indonesia;
- ringkas;
- berbasis berita yang sudah disebutkan;
- konservatif;
- tidak spekulatif berlebihan;
- tidak menjadi personal buy/sell advice;
- jika relevan, hubungkan dengan QC, teknologi, sains, atau industri.

---

# NO FOLLOW-UP

Setelah:

`💡 INSIGHT UNTUK MRK`

SELESAI.

JANGAN menambahkan:

- `mau saya simpan?`
- `mau saya buat PDF?`
- `mau saya lanjutkan?`
- `mau kategori tertentu diperluas?`
- `ada lagi?`
- `apakah ingin saya pantau?`

---

# FINAL RESPONSE GATE — HARD RULE

Sebelum mengirim output:

periksa SETIAP ITEM satu per satu.

Untuk setiap item, jawab:

- Apakah judul ada?
- Apakah ringkasan berita umum >=50 kata?
- Apakah ringkasan riset >=60 kata?
- Apakah URL spesifik ada?
- Apakah URL berasal dari web search?
- Apakah isi sesuai sumber?
- Apakah Bahasa Indonesia?
- Apakah tidak ada foreign-language leakage?
- Apakah bukan placeholder?
- Apakah bukan bullet pendek?
- Apakah tidak ada klaim tanpa sumber?

Jika ADA SATU jawaban "tidak":

JANGAN kirim item tersebut.

Perbaiki atau ganti item.

---

# FINAL VALIDATION CHECKLIST

Sebelum kirim seluruh briefing pastikan:

- [ ] tanggal aktual benar;
- [ ] nama hari benar;
- [ ] rotasi harian benar;
- [ ] seluruh kategori wajib ada;
- [ ] web search benar-benar digunakan;
- [ ] setiap berita umum memiliki >=50 kata;
- [ ] setiap riset memiliki >=60 kata;
- [ ] setiap item memiliki URL spesifik;
- [ ] tidak ada item tanpa sumber;
- [ ] tidak ada URL buatan;
- [ ] tidak ada bullet ringkas sebagai pengganti berita;
- [ ] seluruh narasi Bahasa Indonesia;
- [ ] tidak ada Cyrillic;
- [ ] tidak ada Hanzi acak;
- [ ] tidak ada foreign-language leakage;
- [ ] tidak ada placeholder;
- [ ] Riset Ilmiah & Kimia menggunakan sumber primer bila tersedia;
- [ ] tidak ada personal trading advice;
- [ ] output langsung ke chat;
- [ ] tidak membuat file otomatis;
- [ ] tidak membuat cron;
- [ ] tidak menambahkan follow-up otomatis.

Jika SATU SAJA syarat utama gagal:

JANGAN kirim briefing.

Perbaiki terlebih dahulu.

Jika tidak dapat diperbaiki:

kurangi item atau laporkan kegagalan sumber.

JANGAN mengarang.
