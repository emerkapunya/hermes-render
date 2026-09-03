---
name: daily-news-briefing
description: Membuat Daily Briefing aktual untuk MRK dengan berita Indonesia, dunia, AI, ekonomi, riset ilmiah & kimia, serta topik rotasi harian.
version: 10.0.0
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
- tidak mencampurkan bahasa asing secara acak;
- tidak menghilangkan sumber;
- tidak mengirim item yang belum lengkap.

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

Jika terminal tersedia, gunakan waktu sistem dengan timezone Asia/Jakarta.

Tanggal di header harus sesuai dengan waktu aktual pada saat request dijalankan.

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
- verifikasi tanggal publikasi jika tersedia;
- gunakan fakta yang benar-benar ada di sumber;
- jangan mengarang detail tambahan;
- jangan membuat URL sendiri.

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

# SOURCE FIRST WORKFLOW — REQUIRED

Untuk setiap item berita, workflow wajib:

1. lakukan web search;
2. pilih artikel;
3. ambil URL lengkap;
4. simpan URL;
5. baca fakta utama;
6. susun ringkasan Bahasa Indonesia;
7. cetak URL langsung setelah ringkasan;
8. validasi item;
9. baru lanjut ke item berikutnya.

JANGAN melakukan:

buat semua ringkasan terlebih dahulu
→ lalu mencoba mencari URL setelah semuanya selesai.

URL harus diketahui sebelum item ditulis.

Jika URL belum tersedia:

candidate berita dianggap INVALID.

Jangan gunakan candidate tersebut.

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
- Greek;
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

`Kepergian tokoh tersebut meninggalkan κεν空 yang besar.`

Semua harus ditulis ulang menjadi Bahasa Indonesia yang natural.

Contoh benar:

`Dell melaporkan hasil kuartalan yang melampaui ekspektasi pasar.`

`Rupiah melemah ke sekitar Rp17.700 per dolar AS.`

`Investor khawatir terhadap potensi gelembung valuasi di sektor AI.`

`Kondisi saat ini memerlukan pemantauan lebih lanjut.`

`Kepergiannya meninggalkan kehilangan besar bagi dunia sepak bola nasional.`

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

Jika istilah asing memiliki padanan Bahasa Indonesia yang natural, utamakan padanan Bahasa Indonesia.

Contoh:

`yield` → `imbal hasil`

`earnings` → `kinerja keuangan`

`guidance` → `proyeksi perusahaan`

`safe haven` → `aset lindung nilai`

---

# UNICODE LANGUAGE GUARD

Sebelum mengirim output, scan narasi.

Jika ditemukan karakter dari script berikut:

- Cyrillic;
- Greek;
- Hanzi/CJK;
- Japanese Kana;
- Hangul;
- Arabic;

dan karakter tersebut bukan bagian dari:

- nama resmi;
- judul paper;
- proper noun;
- nama jurnal;
- istilah teknis yang benar-benar diperlukan;

OUTPUT GAGAL.

Rewrite paragraf ke Bahasa Indonesia.

---

# INDONESIAN REWRITE PASS — REQUIRED

Setelah seluruh briefing disusun:

1. baca ulang semua paragraf;
2. cari foreign-language leakage;
3. terjemahkan fragmen asing;
4. tulis ulang kalimat supaya natural;
5. cek grammar Bahasa Indonesia;
6. cek aksara asing;
7. cek istilah Inggris yang sebenarnya bisa diterjemahkan;
8. baru kirim.

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
8. bukan generalisasi tanpa sumber;
9. bukan bullet pendek;
10. bukan klaim yang dibuat tanpa bukti.

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

Perluas menggunakan:

- metode;
- temuan;
- arti hasil;
- limitation;
- aplikasi;

yang benar-benar tersedia di sumber.

JANGAN menambahkan kalimat generik hanya untuk memenuhi jumlah kata.

Jika sumber tidak cukup kaya:

ganti sumber atau ganti berita.

---

# URL OUTPUT ENFORCEMENT — ABSOLUTE HARD RULE

URL BUKAN elemen opsional.

Setiap item berita WAJIB selesai dengan URL sumber.

Struktur setiap item HARUS:

📰 [Judul dalam Bahasa Indonesia]

[Ringkasan lengkap minimal 50 kata]

🔗 Baca lengkap:
https://URL-ARTIKEL-SPESIFIK

Untuk riset:

🧪 [Judul Riset]

[Ringkasan lengkap minimal 60 kata]

🔗 Sumber:
https://URL-PAPER-ATAU-SUMBER-SPESIFIK

DILARANG memulai berita berikutnya sebelum URL item sebelumnya ditulis.

Jika URL belum tersedia:

JANGAN tulis berita tersebut.

Cari sumber lain terlebih dahulu.

---

# ATOMIC NEWS ITEM RULE

Anggap setiap berita sebagai satu unit atomik:

JUDUL
↓
RINGKASAN
↓
URL
↓
VALIDASI
↓
BARU LANJUT KE BERITA BERIKUTNYA

JANGAN membuat item baru sebelum item sebelumnya lengkap.

---

# URL COUNT INVARIANT

Sebelum mengirim setiap BAGIAN:

hitung:

TOTAL_ITEM

dan:

TOTAL_URL

Syarat wajib:

**TOTAL_ITEM = TOTAL_URL**

Contoh:

3 berita
→ wajib ada 3 URL.

4 berita
→ wajib ada 4 URL.

Jika:

TOTAL_URL < TOTAL_ITEM

OUTPUT BAGIAN TERSEBUT GAGAL.

JANGAN KIRIM.

Perbaiki terlebih dahulu.

---

# URL FORMAT REQUIREMENT

URL harus berupa alamat lengkap yang dapat diklik.

BENAR:

`https://www.reuters.com/world/...`

`https://www.antaranews.com/berita/...`

`https://www.nature.com/articles/...`

`https://doi.org/...`

SALAH:

`Reuters`

`ANTARA`

`Nature`

`Google Search`

`Sumber tersedia`

`Link artikel`

`lihat sumber`

---

# SOURCE URL — HARD RULE

Setiap item berita wajib memiliki URL artikel spesifik.

Format:

`🔗 Baca lengkap:`

`https://alamat-artikel-spesifik`

Untuk scientific item:

`🔗 Sumber:`

`https://alamat-paper-atau-publisher`

Jika DOI tersedia:

`DOI: https://doi.org/...`

Jika URL artikel spesifik tidak tersedia:

item tersebut TIDAK BOLEH dimasukkan.

---

# NO NEXT ITEM WITHOUT URL

Sebelum menulis heading:

`📰 Berita berikutnya`

atau:

`🧪 Riset berikutnya`

agent WAJIB memastikan item sebelumnya sudah memiliki:

`🔗 Baca lengkap:`

atau:

`🔗 Sumber:`

beserta URL lengkap.

Jika belum:

STOP.

Lengkapi URL terlebih dahulu.

---

# NO CATEGORY WITHOUT URL COMPLETENESS

Sebelum pindah dari:

`BAGIAN 1/6`

ke:

`BAGIAN 2/6`

pastikan setiap item pada BAGIAN 1 memiliki URL.

Prinsip yang sama berlaku untuk semua bagian.

Jangan lanjut ke kategori berikutnya jika kategori sebelumnya belum lengkap.

---

# WEB RESULT BINDING

Setiap berita harus terikat ke satu sumber web konkret.

Sebelum menulis item, simpan secara internal:

- TITLE
- SOURCE
- URL
- KEY_FACTS

Jika field URL kosong:

candidate berita dianggap INVALID.

Jangan gunakan candidate tersebut.

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

Ringkasan harus memuat jika tersedia:

- fakta utama;
- konteks penting;
- angka atau detail relevan;
- aktor utama;
- waktu kejadian;
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

# SCIENTIFIC FACTUALITY

Untuk riset ilmiah:

JANGAN:

- menyebut korelasi sebagai kausalitas;
- menyebut preliminary finding sebagai kesimpulan final;
- menyebut potensi aplikasi sebagai teknologi yang sudah terbukti;
- membuat angka performa yang tidak ada di paper;
- mengarang metode;
- mengarang DOI.

Jika informasi limitation tidak tersedia:

jangan mengarang limitation spesifik.

Boleh tulis secara konservatif bahwa validasi tambahan mungkin diperlukan jika memang wajar.

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
- `tautan tersedia`
- `sumber menyusul`

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

Jangan mengatribusikan pernyataan kepada:

- menteri;
- presiden;
- analis;
- regulator;
- perusahaan;

jika pernyataan tersebut tidak ada di sumber.

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

# DUPLICATE CONTROL

Jangan memasukkan berita yang sama ke beberapa kategori hanya dengan judul berbeda.

Jika satu berita relevan dengan lebih dari satu kategori:

pilih kategori yang paling tepat.

---

# RECENCY RULE

Prioritaskan berita terbaru.

Untuk berita cepat berubah:

- gunakan artikel terbaru;
- jangan mengutamakan artikel lama jika ada perkembangan baru;
- cek tanggal publikasi.

Untuk paper ilmiah, fokus pada riset terbaru bila tersedia, tetapi kualitas dan relevansi lebih penting daripada sekadar tanggal.

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

Item lengkap.

---

`BAGIAN 2/6 — 🌍 HOT NEWS DUNIA`

Item lengkap.

---

`BAGIAN 3/6 — 🤖 AI & TEKNOLOGI`

Item lengkap.

---

`BAGIAN 4/6 — 💰 KEUANGAN, EKONOMI & INVESTASI`

Item lengkap.

---

`BAGIAN 5/6 — 🧪 RISET ILMIAH & KIMIA`

Item lengkap.

---

`BAGIAN 6/6 — 🔄 TOPIK ROTASI HARI INI`

Item lengkap.

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

Jangan menambahkan fakta baru yang belum muncul di briefing tanpa sumber.

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

# FINAL URL AUDIT

Sebelum mengirim setiap pesan Telegram:

hitung jumlah heading:

`📰`

dan:

`🧪`

Kemudian hitung jumlah:

`🔗 Baca lengkap:`

dan:

`🔗 Sumber:`

Syarat:

**JUMLAH_ITEM = JUMLAH_URL**

Jika tidak sama:

JANGAN KIRIM.

Perbaiki output terlebih dahulu.

---

# FINAL RESPONSE GATE — ABSOLUTE

Untuk SETIAP item:

- [ ] Judul ada
- [ ] Ringkasan berita umum >=50 kata
- [ ] Ringkasan riset >=60 kata
- [ ] URL lengkap ada
- [ ] URL berasal dari hasil web search
- [ ] URL spesifik ke artikel/paper
- [ ] Bahasa Indonesia
- [ ] Tidak ada foreign-language leakage
- [ ] Isi sesuai sumber
- [ ] Tidak ada placeholder
- [ ] Tidak ada klaim tanpa sumber
- [ ] Tidak ada item duplikat

Setelah itu lakukan audit numerik:

`JUMLAH_ITEM = JUMLAH_URL`

Jika tidak sama:

OUTPUT GAGAL.

JANGAN KIRIM.

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
- [ ] jumlah item sama dengan jumlah URL;
- [ ] tidak ada item tanpa sumber;
- [ ] tidak ada URL buatan;
- [ ] tidak ada bullet ringkas sebagai pengganti berita;
- [ ] seluruh narasi Bahasa Indonesia;
- [ ] tidak ada Cyrillic;
- [ ] tidak ada Greek acak;
- [ ] tidak ada Hanzi acak;
- [ ] tidak ada Japanese Kana acak;
- [ ] tidak ada Hangul acak;
- [ ] tidak ada Arabic script acak;
- [ ] tidak ada foreign-language leakage;
- [ ] tidak ada placeholder;
- [ ] Riset Ilmiah & Kimia menggunakan sumber primer bila tersedia;
- [ ] fakta sesuai sumber;
- [ ] tidak ada atribusi palsu;
- [ ] tidak ada item duplikat;
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
