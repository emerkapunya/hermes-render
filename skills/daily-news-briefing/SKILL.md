---
name: daily-news-briefing
description: Membuat Daily Briefing aktual untuk MRK dengan berita Indonesia, dunia, AI & teknologi, ekonomi & investasi, riset ilmiah & kimia, serta topik rotasi harian.
version: 11.0.0
---

# DAILY NEWS BRIEFING — ASPRI MRK

## 1. PURPOSE

Skill ini membuat Daily Briefing yang:

- aktual;
- berdasarkan web search;
- terverifikasi;
- substantif;
- menggunakan Bahasa Indonesia;
- memiliki URL sumber spesifik pada setiap item;
- memiliki ringkasan yang cukup panjang;
- tidak mengarang;
- tidak menggunakan placeholder;
- tidak mencampurkan bahasa asing secara acak;
- tidak menampilkan proses internal agent.

Output ditampilkan langsung ke chat atau Telegram.

JANGAN:

- membuat cron otomatis;
- membuat file otomatis;
- menggunakan subagent secara default;
- menampilkan source ledger;
- menampilkan proses reasoning;
- menampilkan audit internal;
- menampilkan kalimat seperti "sedang mencari sumber";
- menampilkan kalimat seperti "sumber aktual diperoleh";
- menampilkan kalimat seperti "audit final berhasil";
- menawarkan follow-up setelah briefing selesai.

---

# 2. TRIGGERS

Aktifkan skill ini untuk:

- `🔥 Daily Briefing`
- `Daily Briefing`
- `daily briefing`
- `buat daily briefing`
- `briefing berita`
- `briefing pagi`
- `berita terbaru`
- `buat briefing berita terbaru`

Jika trigger berasal dari Telegram:

`🔥 Daily Briefing`

anggap sama dengan:

`buat daily briefing`

JANGAN tampilkan menu lagi sebelum briefing selesai.

---

# 3. DATE & TIME — HARD RULE

Timezone:

`Asia/Jakarta`

Sebelum mencari berita:

1. tentukan tanggal aktual;
2. tentukan hari aktual;
3. verifikasi kecocokan hari dan tanggal;
4. tentukan kategori rotasi berdasarkan hari tersebut.

JANGAN menggunakan tanggal yang tersimpan dari percakapan lama.

JANGAN menebak hari.

Jika runtime/system clock tersedia, gunakan waktu runtime.

Jika terminal tersedia, gunakan timezone Asia/Jakarta.

Header harus berdasarkan tanggal aktual saat request dijalankan.

---

# 4. DAILY ROTATION

Rotasi:

- Senin → Olahraga
- Selasa → Kuliner & Tren Makanan
- Rabu → Kesehatan
- Kamis → Otomotif & Tips Mobil
- Jumat → Self-development & Produktivitas
- Sabtu → Sains & Inovasi
- Minggu → Industri, Energi, Pertambangan, Bauksit, Alumina, Aluminium & Hilirisasi

Kategori:

`🧪 Riset Ilmiah & Kimia`

WAJIB muncul setiap hari dan tidak mengikuti rotasi.

---

# 5. REQUIRED CATEGORIES

Daily Briefing harus memiliki enam bagian:

1. 🇮🇩 Hot News Indonesia
2. 🌍 Hot News Dunia
3. 🤖 AI & Teknologi
4. 💰 Keuangan, Ekonomi & Investasi
5. 🧪 Riset Ilmiah & Kimia
6. 🔄 Topik Rotasi Harian

---

# 6. TARGET ITEM COUNTS

Target:

## 🇮🇩 Hot News Indonesia

3 item

## 🌍 Hot News Dunia

3 item

## 🤖 AI & Teknologi

3 item

## 💰 Keuangan, Ekonomi & Investasi

3 item

## 🧪 Riset Ilmiah & Kimia

2–3 item

## 🔄 Topik Rotasi Harian

2 item

Lebih baik memiliki sedikit item yang lengkap daripada banyak item yang pendek.

Jika sumber berkualitas tidak cukup:

kurangi jumlah item.

JANGAN mengarang untuk memenuhi kuota.

---

# 7. WEB SEARCH — ABSOLUTE REQUIREMENT

Daily Briefing WAJIB menggunakan web search aktual.

JANGAN membuat briefing dari pengetahuan internal saja.

Untuk SETIAP berita:

1. cari sumber aktual;
2. pilih artikel spesifik;
3. simpan URL lengkap;
4. baca fakta dari sumber;
5. buat ringkasan;
6. validasi ringkasan;
7. tampilkan URL;
8. baru lanjut ke berita berikutnya.

Jika web search gagal total:

JANGAN membuat briefing dari ingatan.

Tampilkan hanya:

`⚠️ Daily Briefing tidak dapat dibuat dengan aman karena sumber aktual dari web tidak tersedia. Saya tidak akan mengarang berita.`

---

# 8. SOURCE PRIORITY — GENERAL NEWS

Prioritaskan:

1. sumber primer;
2. kantor berita;
3. media terpercaya;
4. regulator;
5. pemerintah;
6. organisasi resmi;
7. official company newsroom.

Contoh:

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
- pemerintah Indonesia
- Bank Indonesia
- OJK
- kementerian
- OpenAI
- Google
- Microsoft
- NVIDIA
- perusahaan terkait

Jangan menggunakan situs agregator berkualitas rendah jika sumber asli tersedia.

---

# 9. SCIENTIFIC SOURCE PRIORITY

Untuk:

`🧪 Riset Ilmiah & Kimia`

prioritas:

1. paper asli;
2. DOI;
3. publisher jurnal;
4. university research page;
5. research institution;
6. scientific society;
7. preprint dengan konteks yang jelas.

Prioritaskan:

- Nature
- Science
- ACS
- RSC
- Wiley
- Elsevier
- Springer
- Angewandte Chemie
- university research pages
- research institutes
- publisher resmi

Jika sumber primer tersedia:

JANGAN hanya menggunakan artikel media sekunder.

---

# 10. SCIENTIFIC TOPICS OF INTEREST

Prioritaskan:

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
- laboratory automation;
- carbon capture;
- CO₂ conversion;
- photocatalysis;
- sustainable chemistry.

---

# 11. SOURCE LEDGER — INTERNAL ONLY

Sebelum menulis briefing, buat source ledger INTERNAL.

Untuk setiap kandidat simpan:

- CATEGORY
- TITLE
- SOURCE
- PUBLICATION DATE
- FULL URL
- KEY FACTS
- RELEVANCE
- WORD MATERIAL SUFFICIENT?
- VERIFIED?

Untuk riset:

- PAPER TITLE
- JOURNAL
- DOI
- AUTHORS jika relevan
- METHOD
- KEY FINDING
- LIMITATION
- APPLICATION

Source ledger:

JANGAN ditampilkan kepada pengguna.

---

# 12. SOURCE-FIRST WORKFLOW — HARD RULE

Untuk setiap item:

WEB SEARCH
↓
PILIH SUMBER
↓
SIMPAN FULL URL
↓
AMBIL KEY FACTS
↓
BUAT DRAFT RINGKASAN
↓
HITUNG JUMLAH KATA
↓
PERBAIKI JIKA TERLALU PENDEK
↓
VALIDASI URL
↓
VALIDASI BAHASA
↓
BARU TAMPILKAN ITEM

JANGAN membuat semua ringkasan terlebih dahulu lalu mencari URL belakangan.

---

# 13. LANGUAGE POLICY — HARD RULE

Bahasa utama Daily Briefing:

**BAHASA INDONESIA**

Seluruh narasi harus menggunakan Bahasa Indonesia.

Termasuk:

- headline;
- ringkasan;
- konteks;
- analisis;
- dampak;
- risiko;
- peluang;
- insight;
- penjelasan ilmiah.

Sumber boleh menggunakan bahasa apa pun.

Jika sumber menggunakan bahasa asing:

PAHAMI
↓
TERJEMAHKAN MAKNA
↓
TULIS ULANG DALAM BAHASA INDONESIA

JANGAN copy-paste fragmen asing ke narasi.

---

# 14. FOREIGN LANGUAGE LEAKAGE — FORBIDDEN

DILARANG:

`Dell сообщил hasil keuangan...`

`Investor khawatir terhadap 泡沫 AI.`

`Kondisi berada pada уровень tertentu.`

`meninggalkan κεν空 besar.`

Semua harus ditulis ulang ke Bahasa Indonesia natural.

---

# 15. ALLOWED FOREIGN TERMS

Boleh mempertahankan:

- nama orang;
- perusahaan;
- produk;
- ticker;
- jurnal;
- paper title;
- DOI;
- model AI;
- nama metode;
- akronim teknis.

Contoh:

- OpenAI
- NVIDIA
- Gemini
- Reuters
- Nature Chemistry
- Angewandte Chemie
- S&P 500
- ICP-OES
- ICP-MS
- XRF
- XRD
- Bayer Process

Namun kalimat penjelas tetap Bahasa Indonesia.

Jika istilah memiliki terjemahan natural, gunakan terjemahan.

Contoh:

`yield` → `imbal hasil`

`earnings` → `kinerja keuangan`

`guidance` → `proyeksi perusahaan`

`safe haven` → `aset lindung nilai`

---

# 16. UNICODE LANGUAGE GUARD

Sebelum kirim:

periksa apakah narasi mengandung:

- Cyrillic;
- Greek;
- Chinese Hanzi;
- Japanese Kana;
- Hangul;
- Arabic script.

Jika muncul dan bukan nama resmi atau objek yang benar-benar perlu dipertahankan:

VALIDATION GAGAL.

Tulis ulang paragraf tersebut.

---

# 17. WORD COUNT — ABSOLUTE HARD RULE

INI ADALAH ATURAN PENTING.

JANGAN hanya menganggap sebuah paragraf "cukup panjang".

JUMLAH KATA HARUS DIPERIKSA.

## Berita umum

Minimum absolut:

**70 kata**

Target:

**80–130 kata**

## Riset Ilmiah & Kimia

Minimum absolut:

**90 kata**

Target:

**100–160 kata**

Minimum sengaja dibuat lebih tinggi dari kebutuhan awal 50/60 kata untuk menghindari output terlalu pendek.

---

# 18. WORD COUNT VALIDATION WORKFLOW

Untuk setiap ringkasan:

1. buat draft;
2. hitung jumlah kata;
3. jika <70 kata untuk berita umum:
   JANGAN kirim;
4. jika <90 kata untuk riset:
   JANGAN kirim;
5. perluas menggunakan fakta dari sumber;
6. hitung ulang;
7. baru tampilkan setelah memenuhi minimum.

Jika tool Python atau terminal tersedia, gunakan word-count sederhana.

Contoh logika:

`len(text.split())`

Word count adalah proses INTERNAL.

JANGAN tampilkan hasil hitungan kata kepada pengguna.

---

# 19. SENTENCE FLOOR

Selain minimum kata:

## Berita umum

WAJIB memiliki minimal:

**4 kalimat substantif**

## Riset

WAJIB memiliki minimal:

**5 kalimat substantif**

Kalimat pendek seperti:

`Pasar menguat.`

tidak boleh digunakan hanya untuk mengejar jumlah kalimat.

---

# 20. SUMMARY CONTENT — GENERAL NEWS

Ringkasan berita umum sebaiknya menjawab:

1. Apa yang terjadi?
2. Siapa pihak utama?
3. Kapan/di mana?
4. Apa detail atau angka penting?
5. Apa konteksnya?
6. Mengapa berita ini penting?
7. Apa dampak yang masuk akal?

Tidak semua harus ada jika sumber tidak menyediakan.

JANGAN mengarang detail.

---

# 21. SCIENTIFIC SUMMARY CONTENT

Ringkasan riset sebaiknya menjelaskan:

1. masalah penelitian;
2. pendekatan atau metode;
3. material/sistem yang diuji;
4. temuan utama;
5. angka performa penting jika tersedia;
6. apa yang berbeda dari pendekatan sebelumnya;
7. potensi aplikasi;
8. limitation;
9. relevansi ke QC/laboratorium/industri jika relevan.

JANGAN memaksakan relevansi ke alumina jika hubungan ilmiahnya lemah.

---

# 22. URL OUTPUT — ABSOLUTE HARD RULE

URL BUKAN OPSIONAL.

Setiap item WAJIB memiliki URL.

Berita umum:

`🔗 Baca lengkap:`
`https://FULL-URL`

Riset:

`🔗 Sumber:`
`https://FULL-URL`

---

# 23. FULL URL ONLY — NO TRUNCATION

URL harus lengkap.

DILARANG:

`https://federalnewsnetwork.com/...`

`https://nasional.sindonews.com/read/1745849/13/...`

`https://www.aljazeera.com/news/...`

`https://video.kompas.com/...`

Karakter:

`...`

TIDAK BOLEH digunakan untuk menggantikan bagian URL.

Jika URL hasil tool terpotong:

JANGAN menebak sisanya.

Gunakan sumber lain dengan URL lengkap.

---

# 24. URL MUST BE ARTICLE-SPECIFIC

URL harus mengarah ke:

- artikel;
- paper;
- press release;
- halaman penelitian spesifik.

Hindari homepage atau tag page.

Contoh kurang baik:

`https://www.kompas.com/tag/hari-ini`

`https://www.oto.com/berita`

Contoh yang diinginkan:

`https://domain.com/path/judul-artikel-spesifik`

Jika hanya homepage/tag tersedia:

cari sumber alternatif.

---

# 25. ATOMIC ITEM RULE

Setiap berita adalah satu unit:

JUDUL
↓
RINGKASAN
↓
URL
↓
VALIDASI
↓
NEXT ITEM

DILARANG memulai item berikutnya jika item sebelumnya belum memiliki URL.

---

# 26. URL COUNT INVARIANT

Untuk setiap bagian hitung secara internal:

TOTAL_ITEM

TOTAL_URL

Syarat:

**TOTAL_ITEM = TOTAL_URL**

Jika terdapat 3 berita:

harus ada 3 URL.

Jika terdapat 2 riset:

harus ada minimal 2 URL sumber.

Jika tidak sama:

JANGAN kirim bagian tersebut.

---

# 27. ITEM COMPLETENESS GATE

Setiap item valid hanya jika:

- judul ada;
- berita umum >=70 kata;
- riset >=90 kata;
- minimal jumlah kalimat terpenuhi;
- URL lengkap ada;
- URL tidak mengandung `...`;
- URL spesifik;
- isi berasal dari sumber;
- Bahasa Indonesia;
- tidak ada foreign leakage;
- tidak ada placeholder.

Jika gagal:

PERBAIKI atau HAPUS.

---

# 28. NO SHORT BULLETS

DILARANG membuat:

`• Gempa Cianjur — 4 rumah rusak.`

`• Putin bertemu Prabowo.`

`• Yield SBN turun.`

Format tersebut terlalu pendek.

Setiap item harus menjadi mini-brief lengkap.

---

# 29. NO META NARRATION

JANGAN menampilkan:

`Sumber aktual diperoleh.`

`Saya sedang menyusun briefing.`

`Semua kategori sudah diverifikasi.`

`Audit final berhasil.`

`Semua item = URL.`

`Siap dikirim.`

`Riset dipilih dari Nature Chemistry.`

Proses tersebut bersifat internal.

Output pengguna harus langsung dimulai dengan:

`📅 DAILY BRIEFING — ...`

---

# 30. NO SOURCELESS CLAIM

Jangan menulis klaim seperti:

`Menteri mengatakan...`

`Analis memperkirakan...`

`Pemerintah memastikan...`

jika informasi tersebut tidak ada di artikel sumber.

---

# 31. FACTUALITY RULES

Bedakan:

FACT
= dilaporkan sumber.

INTERPRETATION
= implikasi wajar dari fakta.

SPECULATION
= jangan ditampilkan sebagai fakta.

Jangan:

- mengubah korelasi menjadi kausalitas;
- mengubah indikasi menjadi kepastian;
- mengubah prototype menjadi produk matang;
- mengubah potensi aplikasi menjadi implementasi aktual.

---

# 32. SCIENTIFIC FACTUALITY

Jangan mengarang:

- DOI;
- yield;
- conversion;
- selectivity;
- quantum yield;
- stability duration;
- catalyst composition;
- mechanism;
- researcher affiliation;
- publication date.

Semua angka harus berasal dari sumber.

Jika ada ketidakpastian:

gunakan bahasa konservatif.

---

# 33. DUPLICATE CONTROL

Jangan memasukkan berita sama di lebih dari satu kategori.

Jika relevan ke dua kategori:

pilih kategori terbaik.

---

# 34. RECENCY RULE

Prioritaskan berita terbaru.

Untuk topik cepat berubah:

- politik;
- konflik;
- ekonomi;
- pasar;
- AI;
- perusahaan;

prioritaskan perkembangan terbaru.

Jangan memakai artikel lama jika ada perkembangan lebih baru.

---

# 35. FINANCE SAFETY

Untuk berita keuangan:

fokus pada:

- pergerakan pasar;
- faktor penggerak;
- kebijakan;
- risiko;
- peluang;
- konteks.

Jangan otomatis memberikan:

- BUY;
- SELL;
- target harga;
- take profit;
- cut loss;
- alokasi portofolio.

---

# 36. FORMAT BERITA UMUM

WAJIB menggunakan:

`📰 [Judul Bahasa Indonesia]`

Paragraf 80–130 kata, minimum absolut 70 kata.

Minimal 4 kalimat substantif.

`🔗 Baca lengkap:`
`https://URL-LENGKAP`

Kemudian baru lanjut item berikutnya.

---

# 37. FORMAT RISET

WAJIB menggunakan:

`🧪 [Judul Riset dalam Bahasa Indonesia]`

Paragraf 100–160 kata, minimum absolut 90 kata.

Minimal 5 kalimat substantif.

`🔗 Sumber:`
`https://URL-LENGKAP`

Jika tersedia:

`📄 DOI: https://doi.org/...`

---

# 38. TELEGRAM MULTIPART

Daily Briefing kemungkinan panjang.

JANGAN mengorbankan konten agar muat satu pesan.

Gunakan multipart.

Contoh:

`BAGIAN 1/6`

kemudian kirim bagian berikutnya.

JANGAN mengubah setiap kategori menjadi bullet pendek.

---

# 39. OUTPUT STRUCTURE

Output HARUS langsung dimulai:

`📅 DAILY BRIEFING — [Hari, Tanggal]`
`WIB • Asia/Jakarta`

Tidak ada narasi sebelum header.

Kemudian:

`BAGIAN 1/6 — 🇮🇩 HOT NEWS INDONESIA`

3 item lengkap.

Kemudian:

`BAGIAN 2/6 — 🌍 HOT NEWS DUNIA`

3 item lengkap.

Kemudian:

`BAGIAN 3/6 — 🤖 AI & TEKNOLOGI`

3 item lengkap.

Kemudian:

`BAGIAN 4/6 — 💰 KEUANGAN, EKONOMI & INVESTASI`

3 item lengkap.

Kemudian:

`BAGIAN 5/6 — 🧪 RISET ILMIAH & KIMIA`

2–3 item lengkap.

Kemudian:

`BAGIAN 6/6 — 🔄 TOPIK ROTASI HARI INI`

2 item lengkap.

---

# 40. FINAL INSIGHT

Setelah semua bagian selesai:

`💡 INSIGHT UNTUK MRK`

Insight harus:

- Bahasa Indonesia;
- sekitar 80–150 kata;
- menghubungkan beberapa berita penting;
- relevan dengan pekerjaan/minat MRK jika memang ada hubungan;
- konservatif;
- tidak mengarang;
- tidak memberikan personal trading advice.

Jangan memasukkan berita baru di insight.

---

# 41. NO FOLLOW-UP

Setelah Insight:

STOP.

JANGAN menambahkan:

- Mau saya simpan?
- Mau saya buat PDF?
- Mau saya pantau?
- Mau kategori diperluas?
- Ada lagi?
- Siap dikirim.
- Audit selesai.

---

# 42. FINAL PER-ITEM VALIDATION

Untuk SETIAP berita umum:

- [ ] judul ada
- [ ] >=70 kata
- [ ] >=4 kalimat substantif
- [ ] URL lengkap
- [ ] URL tidak mengandung `...`
- [ ] URL artikel spesifik
- [ ] Bahasa Indonesia
- [ ] tidak ada foreign-language leakage
- [ ] fakta sesuai sumber

Untuk SETIAP riset:

- [ ] judul ada
- [ ] >=90 kata
- [ ] >=5 kalimat substantif
- [ ] URL lengkap
- [ ] URL tidak mengandung `...`
- [ ] primary source diprioritaskan
- [ ] metode dijelaskan bila tersedia
- [ ] hasil utama dijelaskan
- [ ] limitation tidak dikarang
- [ ] Bahasa Indonesia

Jika satu item gagal:

JANGAN KIRIM ITEM.

---

# 43. FINAL NUMERICAL AUDIT

Lakukan secara INTERNAL.

Untuk setiap bagian:

`TOTAL_ITEMS = TOTAL_URLS`

dan:

`EVERY_GENERAL_ITEM_WORDS >= 70`

dan:

`EVERY_SCIENCE_ITEM_WORDS >= 90`

Jika salah satu kondisi FALSE:

JANGAN kirim.

Perbaiki dahulu.

JANGAN menampilkan audit ini kepada pengguna.

---

# 44. FINAL LANGUAGE AUDIT

Sebelum kirim:

pastikan tidak ada:

- Cyrillic;
- Greek acak;
- Hanzi acak;
- Japanese Kana;
- Hangul;
- Arabic script;
- kalimat Inggris;
- fragmen bahasa asing.

Pengecualian:

proper noun dan technical term.

Jika gagal:

rewrite.

---

# 45. FINAL URL AUDIT

Periksa:

- setiap item memiliki URL;
- URL lengkap;
- URL tidak memiliki `...`;
- URL bukan homepage jika artikel spesifik tersedia;
- URL berasal dari web search;
- URL tidak dibuat sendiri.

Jika gagal:

ganti sumber.

---

# 46. FINAL OUTPUT GATE — ABSOLUTE

Briefing TIDAK BOLEH dikirim sampai kondisi berikut TRUE:

GENERAL_WORD_COUNT_VALID = TRUE

SCIENCE_WORD_COUNT_VALID = TRUE

URL_COUNT_VALID = TRUE

FULL_URL_VALID = TRUE

LANGUAGE_VALID = TRUE

SOURCE_VALID = TRUE

DATE_VALID = TRUE

NO_PLACEHOLDER = TRUE

NO_META_NARRATION = TRUE

Jika satu saja FALSE:

PERBAIKI.

Jika tidak dapat diperbaiki:

kurangi jumlah berita.

JANGAN menurunkan minimum kualitas.

JANGAN mengarang.

---

# 47. GOLD STANDARD EXAMPLE

Format yang benar:

📰 Harga Minyak Menguat di Tengah Meningkatnya Risiko Geopolitik

Harga minyak bergerak naik setelah pelaku pasar kembali memperhitungkan risiko gangguan pasokan akibat meningkatnya ketegangan geopolitik. Pergerakan tersebut tidak hanya dipengaruhi kondisi di kawasan produsen utama, tetapi juga ekspektasi terhadap permintaan global dan kebijakan produksi negara-negara eksportir. Kenaikan harga energi dapat memengaruhi inflasi, biaya transportasi, serta biaya produksi sejumlah industri. Bagi Indonesia, perubahan harga minyak juga relevan terhadap neraca perdagangan energi dan kebijakan harga domestik. Pergerakan selanjutnya tetap bergantung pada perkembangan konflik, pasokan global, dan respons negara produsen.

🔗 Baca lengkap:
https://example.com/full-specific-article-url

Bukan:

• Harga minyak naik karena konflik. URL: https://example.com/...
