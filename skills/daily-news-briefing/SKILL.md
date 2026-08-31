---
name: daily-news-briefing
description: Membuat briefing berita terkini Indonesia dan dunia menggunakan web search aktual, verifikasi sumber, ringkasan satu paragraf per berita, dan URL artikel asli.
version: 3.0.0
author: MRK
---

# DAILY NEWS BRIEFING — ASPRI MRK

## TUJUAN

Skill ini digunakan ketika MRK meminta:

- briefing berita;
- briefing pagi;
- berita terbaru;
- hot news;
- breaking news;
- berita Indonesia;
- berita dunia;
- update AI;
- update teknologi;
- update keuangan;
- update investasi;
- perkembangan terkini;
- daily news;
- news update.

Skill ini harus dijalankan pada sesi percakapan utama.

JANGAN membuat cron.

JANGAN membuat scheduled task.

JANGAN mendelegasikan tugas ini kepada subagent kecuali MRK secara eksplisit meminta delegasi.

JANGAN mengerjakan briefing di background.

JANGAN hanya mengatakan bahwa briefing sedang dibuat atau sudah selesai.

Hasil utama harus langsung ditampilkan dalam percakapan.

---

# PRINSIP UTAMA

Briefing berita harus berdasarkan informasi aktual dari internet.

Pengetahuan internal model TIDAK boleh digunakan sebagai satu-satunya sumber untuk berita terkini.

Untuk setiap briefing:

- gunakan tool web;
- cari sumber aktual;
- verifikasi informasi;
- gunakan artikel spesifik;
- sertakan URL sumber;
- tulis ringkasan berdasarkan sumber yang ditemukan.

JANGAN mengarang:

- berita;
- fakta;
- angka;
- tanggal;
- nama;
- harga;
- statistik;
- kutipan;
- sumber;
- URL.

Jika sebuah berita tidak berhasil diverifikasi, jangan masukkan berita tersebut.

---

# WEB SEARCH WAJIB

Untuk setiap briefing, WAJIB gunakan tool:

`web_search`

Jangan hanya mengandalkan knowledge internal model.

Jangan mengklaim web search berhasil jika tidak ada hasil nyata dari tool.

---

# PROVIDER INDEPENDENCE

Skill ini tidak bergantung pada provider web tertentu.

JANGAN mengunci pencarian ke:

- Tavily;
- Firecrawl;
- Brave;
- Exa;
- DDGS;
- provider tertentu lainnya.

Gunakan backend web yang tersedia dan berhasil digunakan oleh Hermes pada saat eksekusi.

Yang penting adalah keberhasilan tool `web_search`, bukan nama provider.

Jika satu backend gagal tetapi Hermes menyediakan fallback backend lain, gunakan fallback tersebut.

Jangan mengatakan:

"Tavily tidak tersedia, maka briefing gagal"

jika tool web masih dapat digunakan melalui backend lain.

---

# ALUR RISET

Untuk setiap briefing lakukan langkah berikut:

1. Jalankan `web_search`.
2. Gunakan beberapa query berbeda.
3. Lakukan pencarian terpisah untuk setiap kategori.
4. Prioritaskan berita dari 24 jam terakhir.
5. Untuk breaking news, prioritaskan perkembangan beberapa jam terakhir.
6. Gunakan `web_extract` jika tersedia dan diperlukan untuk membaca artikel penting.
7. Verifikasi tanggal publikasi.
8. Verifikasi fakta utama.
9. Verifikasi angka, nama, perusahaan, lembaga, lokasi, dan data penting.
10. Cross-check berita besar atau meragukan menggunakan sumber tambahan.
11. Pastikan URL benar-benar mengarah ke artikel yang relevan.
12. Buang berita yang tidak berhasil diverifikasi.
13. Hindari berita duplikat atau berita dengan substansi yang sama.

Jangan hanya menggunakan satu query untuk seluruh briefing.

---

# JIKA WEB SEARCH GAGAL

Jika percobaan pertama `web_search` gagal:

1. coba query yang lebih sederhana;
2. coba kata kunci alternatif;
3. coba kategori lain;
4. biarkan Hermes menggunakan fallback backend jika tersedia;
5. lakukan beberapa percobaan yang wajar.

Jika setelah percobaan ulang tool web benar-benar tidak tersedia:

BERHENTI.

Katakan:

"Web search saat ini tidak tersedia sehingga saya tidak akan membuat briefing yang belum terverifikasi."

JANGAN:

- membuat briefing dari pengetahuan internal;
- mengarang berita;
- mengarang URL;
- mengklaim web search berhasil;
- mengirim berita lama seolah-olah berita terbaru.

---

# CAKUPAN WAJIB

Briefing harus mencakup kategori berikut:

1. Hot News Indonesia
2. Hot News Dunia
3. AI & Teknologi
4. Keuangan, Ekonomi & Investasi
5. Topik Rotasi Harian

Semua kategori wajib dicari melalui web.

---

# 1. HOT NEWS INDONESIA

Cari beberapa perkembangan paling penting di Indonesia.

Prioritaskan jika relevan:

- nasional;
- ekonomi;
- kebijakan pemerintah;
- industri;
- teknologi;
- energi;
- bencana;
- keamanan;
- sosial;
- hukum;
- bisnis;
- peristiwa besar;
- isu yang berdampak luas.

Jangan membatasi kategori ini menjadi satu berita saja.

Jika sumber tersedia, targetkan minimal 3 berita penting.

Jumlah tersebut bukan batas maksimum.

Jika ada lebih banyak perkembangan penting yang terverifikasi, masukkan semuanya.

---

# 2. HOT NEWS DUNIA

Cari beberapa perkembangan internasional paling penting.

Prioritaskan:

- geopolitik;
- konflik;
- diplomasi;
- ekonomi global;
- energi;
- keamanan;
- teknologi;
- kebijakan besar;
- perubahan pemerintahan;
- bencana;
- peristiwa internasional besar;
- perkembangan yang berpotensi berdampak global.

Jika sumber tersedia, targetkan minimal 3 berita penting.

Jumlah tersebut bukan batas maksimum.

---

# 3. ARTIFICIAL INTELLIGENCE & TEKNOLOGI

Cari beberapa perkembangan terbaru mengenai:

- OpenAI;
- Google;
- Anthropic;
- Meta;
- Microsoft;
- NVIDIA;
- AI Agent;
- model AI baru;
- open-weight / open-source AI;
- otomasi;
- robotics;
- chip AI;
- data center;
- hardware AI;
- penelitian AI;
- regulasi AI;
- keamanan AI;
- cybersecurity;
- teknologi baru;
- inovasi digital.

Prioritaskan perkembangan yang memiliki dampak pada:

- pekerjaan;
- industri;
- otomasi;
- data;
- produktivitas;
- bisnis;
- investasi;
- inovasi.

Jika sumber tersedia, targetkan minimal 3 berita.

Jumlah tersebut bukan batas maksimum.

---

# 4. KEUANGAN, EKONOMI & INVESTASI

Cari beberapa perkembangan terbaru mengenai:

- IHSG;
- rupiah;
- saham;
- emas;
- minyak;
- komoditas;
- suku bunga;
- inflasi;
- obligasi;
- bank sentral;
- ekonomi Indonesia;
- ekonomi global;
- investasi;
- perusahaan besar;
- sektor yang mengalami perubahan signifikan;
- kebijakan ekonomi;
- perkembangan pasar.

Semua angka keuangan wajib diverifikasi sebelum ditampilkan.

Jangan menggunakan angka yang hanya diperkirakan oleh model.

Jika sumber tersedia, targetkan minimal 3 berita.

Jumlah tersebut bukan batas maksimum.

---

# 5. TOPIK ROTASI HARIAN

Gunakan hari lokal:

`Asia/Jakarta`

Rotasi:

## Senin
Olahraga

## Selasa
Kuliner dan tren makanan

## Rabu
Kesehatan

## Kamis
Otomotif dan tips mobil

## Jumat
Self-development dan produktivitas

## Sabtu
Sains dan inovasi

## Minggu
Industri, energi, pertambangan, bauksit, alumina, aluminium, dan hilirisasi

Topik rotasi adalah tambahan.

Kategori:

- Hot News Indonesia;
- Hot News Dunia;
- AI & Teknologi;
- Keuangan, Ekonomi & Investasi;

tetap wajib setiap briefing.

Jika sumber tersedia, targetkan minimal 2 berita pada topik rotasi.

---

# JUMLAH BERITA

Tidak ada jumlah berita maksimum.

Jangan membatasi briefing hanya menjadi 5 berita.

Jangan memberikan satu berita per kategori jika masih ada berita penting lain yang terverifikasi.

Gunakan prinsip:

Kualitas + Kebaruan + Relevansi > Jumlah.

Jika banyak berita penting tersedia, tampilkan semuanya.

Jika hanya sedikit berita yang benar-benar layak, jangan mengarang tambahan.

Target minimum jika sumber tersedia:

- Hot News Indonesia: 3+
- Hot News Dunia: 3+
- AI & Teknologi: 3+
- Keuangan/Ekonomi/Investasi: 3+
- Topik Rotasi: 2+

Jumlah tersebut bukan kuota wajib jika sumber yang valid memang terbatas.

---

# VALIDASI SUMBER

Sebelum memasukkan berita, pastikan:

- artikel ditemukan melalui web search;
- tanggal publikasi relevan;
- artikel benar-benar membahas berita tersebut;
- informasi utama sesuai isi sumber;
- angka sesuai sumber;
- nama orang/perusahaan/lembaga benar;
- URL valid;
- URL bukan hasil tebakan;
- berita masih aktual.

Jika ada keraguan:

lakukan pencarian tambahan.

---

# PRIORITAS SUMBER

Prioritaskan:

1. sumber resmi;
2. lembaga pemerintah;
3. regulator;
4. perusahaan atau organisasi terkait;
5. Reuters;
6. Associated Press;
7. AFP;
8. media nasional kredibel;
9. media internasional kredibel;
10. media spesialis yang relevan dan kredibel.

Contoh sumber primer:

- BMKG untuk cuaca;
- Bank Indonesia untuk kebijakan moneter;
- BEI untuk informasi pasar tertentu;
- perusahaan untuk pengumuman resmi;
- regulator untuk regulasi;
- lembaga pemerintah untuk kebijakan atau statistik resmi.

---

# SUMBER YANG SEBAIKNYA DIHINDARI

Jangan gunakan sebagai sumber utama jika sumber lebih kredibel tersedia:

- Facebook;
- posting media sosial tidak resmi;
- forum;
- homepage media;
- halaman kategori;
- agregator;
- situs tanpa artikel spesifik;
- hasil pencarian tanpa artikel aktual.

URL harus mengarah langsung ke artikel atau sumber yang relevan.

Contoh yang tidak cukup:

`https://www.aljazeera.com`

Contoh yang diinginkan:

`https://www.aljazeera.com/news/.../judul-artikel`

---

# CROSS-CHECK

Lakukan cross-check jika:

- berita berdampak besar;
- angka terlihat tidak masuk akal;
- informasi sensitif;
- terdapat konflik antar sumber;
- sumber utama kurang kuat;
- fakta terlihat tidak konsisten;
- breaking news masih berkembang.

Jika dua sumber kredibel memberikan informasi berbeda:

jelaskan bahwa informasi masih berkembang atau jangan masukkan fakta yang belum jelas.

---

# QUALITY CONTROL

Untuk setiap berita, tanyakan:

1. Apakah berita ini benar-benar aktual?
2. Apakah sumbernya dapat dipercaya?
3. Apakah tanggal publikasinya relevan?
4. Apakah judul sesuai isi?
5. Apakah angka sudah diverifikasi?
6. Apakah URL benar?
7. Apakah artikel spesifik tersedia?
8. Apakah berita ini sudah muncul sebelumnya dalam briefing?
9. Apakah ringkasan sesuai sumber?
10. Apakah berita ini cukup penting untuk dimasukkan?

Jika jawabannya tidak memuaskan:

perbaiki atau buang berita tersebut.

---

# OUTPUT CONTRACT — WAJIB

Respons akhir kepada MRK WAJIB berupa ISI BRIEFING LENGKAP.

Respons final WAJIB langsung dimulai dengan:

`📰 DAILY BRIEFING — ASPRI MRK`

JANGAN memberikan kalimat pembuka seperti:

- "Briefing siap dikirim."
- "Saya sudah selesai mencari berita."
- "Berikut ringkasannya."
- "Output lengkap sudah dikirim."
- "Laporan sudah disusun."
- "Saya telah melakukan verifikasi."
- "File berhasil dibuat."
- "Berita berhasil dikumpulkan."

JANGAN mengirim status pekerjaan sebagai pengganti briefing.

JANGAN memberikan ringkasan meta dari briefing.

JANGAN mengatakan briefing lengkap sudah dikirim jika isi lengkap belum benar-benar tampil di percakapan.

---

# FORMAT HEADER

Gunakan:

# 📰 DAILY BRIEFING — ASPRI MRK

📅 [Hari, tanggal]

🕒 Update: [jam WIB]

---

# FORMAT WAJIB SETIAP BERITA

Untuk setiap berita gunakan struktur berikut:

### 📰 [Judul berita]

[Ringkasan SATU paragraf penuh sekitar 3–6 kalimat. Jelaskan apa yang terjadi, perkembangan terbaru, konteks penting, dampaknya, dan mengapa berita ini relevan.]

🔗 **Baca lengkap:**
[URL artikel spesifik]

Jika terdapat sumber kedua yang penting:

🔗 **Referensi tambahan:**
[URL artikel kedua]

---

Jangan menghilangkan URL.

Jangan mengganti URL dengan nama media saja.

Jangan hanya menampilkan headline.

---

# STRUKTUR OUTPUT

Gunakan struktur:

## 🇮🇩 HOT NEWS INDONESIA

[Beberapa berita lengkap]

## 🌍 HOT NEWS DUNIA

[Beberapa berita lengkap]

## 🤖 AI & TEKNOLOGI

[Beberapa berita lengkap]

## 💰 KEUANGAN, EKONOMI & INVESTASI

[Beberapa berita lengkap]

## 🎯 TOPIK ROTASI HARIAN

[Beberapa berita lengkap]

---

# RINGKASAN BERITA

Setiap berita harus memiliki satu paragraf yang menjelaskan:

- apa yang terjadi;
- perkembangan terbaru;
- konteks;
- dampak;
- alasan berita tersebut penting.

Jangan hanya menulis satu kalimat.

Jangan hanya menyalin headline.

Jangan membuat ringkasan terlalu pendek sehingga kehilangan konteks.

---

# URL POLICY

Setiap berita WAJIB memiliki minimal satu URL.

URL harus:

- ditemukan melalui web search;
- valid;
- spesifik;
- relevan;
- mengarah langsung ke artikel atau sumber resmi.

JANGAN membuat URL sendiri.

JANGAN menggunakan URL homepage jika artikel spesifik tersedia.

Jika artikel spesifik tidak ditemukan:

jangan masukkan berita tersebut.

---

# TELEGRAM DELIVERY — WAJIB

Hasil utama harus dikirim langsung ke percakapan Telegram.

JANGAN mengganti hasil dengan:

- file;
- path;
- status;
- ringkasan meta;
- pesan "laporan selesai";
- daftar singkat headline.

Jika briefing terlalu panjang untuk satu pesan Telegram:

PECAH briefing menjadi beberapa pesan.

Jangan mengurangi jumlah berita hanya untuk menyesuaikan panjang pesan.

Pemisahan yang disarankan:

BAGIAN 1/N — Hot News Indonesia

BAGIAN 2/N — Hot News Dunia

BAGIAN 3/N — AI & Teknologi

BAGIAN 4/N — Keuangan, Ekonomi & Investasi

BAGIAN 5/N — Topik Rotasi + Insight

Jika satu kategori sangat panjang, pecah kategori tersebut menjadi beberapa bagian.

---

# DILARANG MEMBUAT BACKUP FILE SECARA DEFAULT

JANGAN membuat file backup.

JANGAN menulis briefing ke file lokal secara otomatis.

JANGAN membuat folder briefing.

JANGAN menyimpan output ke:

- `/opt/data/`
- `/workspace/`
- `/tmp/`
- folder lain;

kecuali MRK secara eksplisit meminta hasil disimpan sebagai file.

JANGAN mengatakan:

"Mau saya simpan file backup?"

setelah briefing.

JANGAN menawarkan penyimpanan file secara otomatis.

Default behavior adalah:

**Cari berita → verifikasi → tampilkan langsung ke Telegram.**

Tidak ada pembuatan file dalam workflow normal.

---

# JANGAN BEKERJA DI BACKGROUND

Skill ini harus menghasilkan jawaban pada request yang sedang berjalan.

JANGAN mengatakan:

- "sedang berjalan di background";
- "saya akan mengirim hasil nanti";
- "tunggu beberapa menit";
- "saya akan memberitahu ketika selesai";

kecuali sistem benar-benar memiliki mekanisme asynchronous yang eksplisit diminta pengguna.

Untuk penggunaan normal:

selesaikan pencarian dan kirim briefing pada turn yang sama.

---

# JANGAN DELEGASIKAN SECARA DEFAULT

Jangan spawn subagent untuk briefing ini.

Jangan mengirim tugas ini ke delegated agent.

Jangan menggunakan subagent hanya karena briefing panjang.

Kerjakan melalui sesi utama.

Delegasi hanya boleh dilakukan jika MRK secara eksplisit meminta:

- gunakan subagent;
- delegasikan;
- gunakan multi-agent;
- atau perintah setara.

---

# JANGAN MEMBUAT CRON

Skill ini adalah tugas manual.

JANGAN:

- membuat cron;
- membuat scheduler;
- menambahkan recurring job;
- mengaktifkan Daily News otomatis.

Cron hanya boleh dibuat kembali jika MRK secara eksplisit meminta jadwal otomatis.

---

# YANG PERLU DIPANTAU

Setelah seluruh kategori berita selesai, tambahkan:

## 🔎 YANG PERLU DIPANTAU HARI INI

Berikan beberapa poin tentang perkembangan yang:

- masih berlangsung;
- berpotensi berubah;
- dapat menghasilkan breaking news baru;
- relevan bagi MRK.

Gunakan fakta dari briefing, bukan spekulasi liar.

---

# INSIGHT UNTUK MRK

Tambahkan:

## 💡 INSIGHT UNTUK MRK

Berikan sekitar 2–5 insight yang benar-benar relevan.

Insight dapat terkait:

- pekerjaan;
- Quality Control;
- industri;
- alumina/bauksit;
- AI;
- otomasi;
- teknologi;
- keuangan;
- investasi;
- produktivitas;
- risiko;
- peluang.

Insight harus diturunkan dari berita yang sudah ditemukan.

Jangan membuat insight acak yang tidak berhubungan dengan briefing.

---

# FINAL CHECKLIST

Sebelum mengirim jawaban final, WAJIB cek:

- [ ] `web_search` benar-benar digunakan.
- [ ] Beberapa query pencarian digunakan.
- [ ] Berita aktual.
- [ ] Berita berasal dari sumber yang valid.
- [ ] Setiap berita memiliki URL.
- [ ] URL mengarah ke artikel spesifik.
- [ ] Setiap berita memiliki ringkasan satu paragraf.
- [ ] Hot News Indonesia memiliki beberapa berita.
- [ ] Hot News Dunia memiliki beberapa berita.
- [ ] AI & Teknologi memiliki beberapa berita.
- [ ] Keuangan/Ekonomi/Investasi memiliki beberapa berita.
- [ ] Topik rotasi memiliki beberapa berita jika sumber tersedia.
- [ ] Tidak ada URL buatan.
- [ ] Tidak ada fakta yang tidak diverifikasi.
- [ ] Tidak ada file backup yang dibuat secara default.
- [ ] Tidak ada pesan meta sebagai pengganti briefing.
- [ ] Hasil lengkap benar-benar tampil di Telegram.

Jika checklist gagal pada berita tertentu:

perbaiki atau hapus berita tersebut.

Jika checklist gagal untuk seluruh briefing karena web tidak tersedia:

jelaskan kegagalan dengan jujur dan jangan membuat berita.

---

# CONTOH OUTPUT BENAR

📰 DAILY BRIEFING — ASPRI MRK

📅 Senin, 31 Agustus 2026

🕒 Update: 08:30 WIB

## 🇮🇩 HOT NEWS INDONESIA

### 📰 [Judul berita Indonesia pertama]

[Ringkasan satu paragraf penuh mengenai apa yang terjadi, konteks, perkembangan terbaru, serta dampaknya.]

🔗 **Baca lengkap:**
https://contoh.com/artikel-1

---

### 📰 [Judul berita Indonesia kedua]

[Ringkasan satu paragraf penuh.]

🔗 **Baca lengkap:**
https://contoh.com/artikel-2

---

### 📰 [Judul berita Indonesia ketiga]

[Ringkasan satu paragraf penuh.]

🔗 **Baca lengkap:**
https://contoh.com/artikel-3

---

## 🌍 HOT NEWS DUNIA

### 📰 [Judul berita dunia pertama]

[Ringkasan satu paragraf.]

🔗 **Baca lengkap:**
https://contoh.com/artikel-4

---

## 🤖 AI & TEKNOLOGI

### 📰 [Judul berita AI pertama]

[Ringkasan satu paragraf.]

🔗 **Baca lengkap:**
https://contoh.com/artikel-5

---

## 💰 KEUANGAN, EKONOMI & INVESTASI

### 📰 [Judul berita keuangan pertama]

[Ringkasan satu paragraf.]

🔗 **Baca lengkap:**
https://contoh.com/artikel-6

---

## 🎯 TOPIK ROTASI HARIAN

### 📰 [Judul]

[Ringkasan satu paragraf.]

🔗 **Baca lengkap:**
https://contoh.com/artikel-7

---

## 🔎 YANG PERLU DIPANTAU HARI INI

- ...
- ...
- ...

## 💡 INSIGHT UNTUK MRK

1. ...
2. ...
3. ...

---

# CONTOH OUTPUT YANG SALAH

JANGAN menghasilkan:

"Briefing siap dikirim."

JANGAN menghasilkan:

"Berikut ringkasan hasil verifikasi web:
- Indonesia: ...
- Dunia: ...
- AI: ...
- Keuangan: ..."

JANGAN menghasilkan:

"Laporan lengkap telah disusun."

JANGAN menghasilkan:

"File tersimpan di /opt/data/briefing.md."

JANGAN menghasilkan:

"Output lengkap sudah dikirim ke Telegram."

JANGAN menghasilkan:

"Saya akan memprosesnya di background."

Semua contoh tersebut dianggap GAGAL.

Output yang benar adalah isi briefing lengkap itu sendiri.

---

# CORE RULE

Default workflow skill ini hanya:

`web_search`
→ `web_extract` bila diperlukan
→ verifikasi
→ susun beberapa berita
→ ringkasan satu paragraf per berita
→ sertakan URL
→ tampilkan briefing lengkap langsung di Telegram

Tidak ada:

- cron;
- subagent;
- background processing;
- backup file;
- meta-summary;

kecuali MRK secara eksplisit meminta hal tersebut.