---
name: daily-news-briefing
description: Membuat briefing berita terkini Indonesia dan dunia menggunakan web search aktual, verifikasi sumber, ringkasan substantif per berita, dan URL artikel asli.
version: 4.0.0
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

JANGAN mendelegasikan tugas ini ke subagent kecuali MRK secara eksplisit meminta delegasi.

JANGAN mengerjakan briefing di background.

Hasil utama harus langsung ditampilkan dalam percakapan.

---

# PRINSIP UTAMA

Briefing berita harus berdasarkan informasi aktual dari internet.

Pengetahuan internal model TIDAK boleh digunakan sebagai satu-satunya sumber untuk berita terkini.

Untuk setiap briefing:

1. gunakan web search;
2. temukan artikel aktual;
3. catat URL asli;
4. verifikasi fakta utama;
5. cross-check bila diperlukan;
6. susun ringkasan substantif;
7. tampilkan hasil lengkap langsung di percakapan.

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

Untuk setiap briefing WAJIB gunakan tool:

`web_search`

Jangan hanya mengandalkan pengetahuan internal model.

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

Gunakan backend web yang tersedia dan berhasil digunakan Hermes pada saat eksekusi.

Yang penting adalah keberhasilan tool `web_search`, bukan nama provider.

Jika satu backend gagal tetapi Hermes menyediakan fallback backend lain, gunakan fallback tersebut.

Jangan mengatakan:

"Tavily tidak tersedia, maka briefing gagal"

jika tool web masih dapat bekerja melalui backend lain.

---

# WEB SEARCH RECOVERY

Jika percobaan pertama web search gagal:

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
- menggunakan berita lama seolah-olah baru;
- mengklaim web search berhasil jika tidak ada hasil tool.

---

# SOURCE LEDGER — WAJIB

Sebelum menulis briefing akhir, buat SOURCE LEDGER internal.

SOURCE LEDGER digunakan sebagai sumber kebenaran untuk semua berita yang akan ditampilkan.

Untuk setiap kandidat berita catat:

- judul artikel;
- nama sumber/media;
- tanggal publikasi;
- URL lengkap artikel;
- fakta utama;
- kategori briefing.

Contoh internal:

SOURCE 01

Judul:
[Judul artikel]

Media:
Reuters

Tanggal:
31 Agustus 2026

URL:
https://www.reuters.com/world/example-article-2026-08-31/

Fakta utama:
[Ringkasan fakta dari artikel]

Kategori:
Hot News Dunia

---

JANGAN menampilkan SOURCE LEDGER ke pengguna.

SOURCE LEDGER hanya dipakai untuk menjaga konsistensi fakta dan URL.

JANGAN memasukkan berita ke briefing jika URL lengkapnya tidak tersedia di SOURCE LEDGER.

---

# URL RULE — SANGAT PENTING

Setiap berita WAJIB mempunyai minimal satu URL artikel lengkap.

URL harus:

- berasal dari hasil web search;
- valid;
- spesifik;
- relevan;
- mengarah langsung ke artikel atau sumber resmi.

JANGAN:

- membuat URL;
- menebak URL;
- memendekkan URL;
- mengganti URL dengan nama media;
- mengganti URL dengan domain utama;
- hanya menulis [Reuters];
- hanya menulis [Kompas];
- hanya menulis Tirto / Liputan6;
- hanya menulis Sumber: Reuters.

Contoh BENAR:

https://www.reuters.com/world/asia-pacific/example-2026-08-31/

Contoh SALAH:

Reuters

Contoh SALAH:

[Reuters]

Contoh SALAH:

https://www.reuters.com

Contoh SALAH:

Reuters / AP

Jika artikel spesifik tidak ditemukan:

JANGAN masukkan berita tersebut.

---

# WEB EXTRACT DAN VERIFIKASI

Jika `web_extract` tersedia, gunakan untuk artikel penting.

Gunakan web extract atau sumber tambahan terutama jika:

- berita berdampak besar;
- breaking news;
- angka terlihat aneh;
- ada konflik antar sumber;
- informasi sensitif;
- fakta terlihat tidak konsisten;
- sumber pertama kurang kuat.

Jangan menganggap headline saja cukup untuk menyusun ringkasan panjang.

---

# CAKUPAN WAJIB

Briefing harus mencakup:

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
- isu berdampak luas.

Jika sumber aktual tersedia, targetkan:

3–6 berita penting.

Jumlah tersebut bukan batas maksimum.

Jika hanya sedikit berita yang benar-benar penting, jangan mengarang tambahan.

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
- kebijakan besar;
- perubahan pemerintahan;
- bencana;
- perkembangan global signifikan.

Jika sumber aktual tersedia, targetkan:

3–6 berita penting.

---

# 3. AI & TEKNOLOGI

Cari perkembangan terbaru mengenai:

- OpenAI;
- Google;
- Anthropic;
- Meta;
- Microsoft;
- NVIDIA;
- AI Agent;
- model AI baru;
- open-weight AI;
- open-source AI;
- otomasi;
- robotics;
- chip AI;
- data center;
- hardware AI;
- penelitian AI;
- regulasi AI;
- cybersecurity;
- inovasi teknologi.

Prioritaskan perkembangan yang berdampak pada:

- pekerjaan;
- industri;
- otomasi;
- data;
- produktivitas;
- bisnis;
- investasi;
- inovasi.

Jika sumber aktual tersedia, targetkan:

3–6 berita penting.

Jika benar-benar tidak ada berita AI besar dalam 24 jam terakhir:

boleh gunakan perkembangan teknologi besar lain yang relevan,

tetapi jangan mengganti kategori AI dengan olahraga atau kategori lain.

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
- kebijakan ekonomi;
- perkembangan pasar.

Semua angka keuangan wajib diverifikasi sebelum ditampilkan.

Jika sumber aktual tersedia, targetkan:

3–6 berita penting.

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

Topik rotasi adalah kategori tambahan.

Topik rotasi tidak boleh menggantikan:

- Hot News Indonesia;
- Hot News Dunia;
- AI & Teknologi;
- Keuangan/Ekonomi/Investasi.

Jika sumber tersedia, targetkan:

2–4 berita.

---

# JUMLAH BERITA

Tidak ada jumlah maksimum.

Jangan membatasi briefing hanya menjadi 5 berita.

Jika banyak berita penting dan terverifikasi tersedia, tampilkan semuanya.

Target umum jika sumber tersedia:

- Indonesia: 3–6
- Dunia: 3–6
- AI & Teknologi: 3–6
- Keuangan: 3–6
- Rotasi: 2–4

Kualitas lebih penting daripada jumlah.

Jangan mengarang berita untuk memenuhi target.

---

# MINIMUM CONTENT PER NEWS ITEM

Setiap berita WAJIB memiliki ringkasan substantif.

Target panjang:

80–150 kata per berita.

Minimal:

4 kalimat penuh.

Ideal:

4–6 kalimat.

Ringkasan harus menjawab:

1. Apa yang terjadi?
2. Siapa atau pihak apa yang terlibat?
3. Apa perkembangan terbaru?
4. Apa konteks yang perlu diketahui?
5. Mengapa berita ini penting?
6. Apa dampaknya jika relevan?

JANGAN menulis ringkasan satu kalimat.

JANGAN hanya mengulang headline.

JANGAN membuat ringkasan berupa bullet pendek.

---

# VALIDASI SUMBER

Sebelum memasukkan berita, cek:

- apakah artikel ditemukan lewat web search;
- apakah tanggal publikasi relevan;
- apakah artikel benar-benar membahas berita;
- apakah fakta utama sesuai;
- apakah angka benar;
- apakah nama pihak benar;
- apakah URL spesifik;
- apakah berita masih aktual;
- apakah berita bukan duplikat.

Jika ada keraguan:

lakukan pencarian tambahan.

---

# PRIORITAS SUMBER

Prioritaskan:

1. sumber resmi;
2. lembaga pemerintah;
3. regulator;
4. organisasi/perusahaan terkait;
5. Reuters;
6. Associated Press;
7. AFP;
8. media nasional kredibel;
9. media internasional kredibel;
10. media spesialis kredibel.

Contoh sumber primer:

- BMKG untuk cuaca;
- Bank Indonesia untuk kebijakan moneter;
- BEI untuk informasi pasar tertentu;
- pemerintah untuk kebijakan;
- perusahaan untuk pengumuman resmi.

---

# SUMBER YANG SEBAIKNYA DIHINDARI

Jangan gunakan sebagai sumber utama jika ada sumber lebih baik:

- Facebook;
- media sosial tidak resmi;
- forum;
- homepage media;
- halaman kategori;
- agregator;
- situs tanpa artikel spesifik.

Contoh SALAH:

https://www.aljazeera.com

Contoh BENAR:

https://www.aljazeera.com/news/2026/8/31/example-article

---

# CROSS-CHECK

Lakukan cross-check jika:

- berita berdampak besar;
- breaking news;
- angka terlihat tidak masuk akal;
- informasi sensitif;
- ada konflik informasi;
- sumber utama kurang kuat;
- fakta terlihat tidak konsisten.

Jika dua sumber kredibel berbeda:

jelaskan ketidakpastian atau jangan tampilkan fakta yang belum jelas.

---

# OUTPUT CONTRACT — WAJIB

Respons akhir kepada MRK WAJIB berupa ISI BRIEFING LENGKAP.

Baris pertama WAJIB:

`📰 DAILY BRIEFING — ASPRI MRK`

JANGAN memberi kalimat pembuka sebelum judul.

JANGAN menulis:

- "Briefing siap dikirim."
- "Berita terverifikasi."
- "Saya sudah melakukan web search."
- "Output lengkap sudah dikirim."
- "Laporan sudah disusun."
- "Berikut ringkasannya."
- "Saya telah selesai."
- pesan status proses lainnya.

Langsung tampilkan isi briefing.

---

# FORMAT HEADER

Gunakan:

# 📰 DAILY BRIEFING — ASPRI MRK

📅 [Hari, tanggal]

🕒 Update: [jam WIB]

---

# FORMAT WAJIB SETIAP BERITA

Gunakan pola berikut:

### 📰 [Judul berita]

[Ringkasan 80–150 kata, minimal 4 kalimat. Jelaskan fakta utama, perkembangan terbaru, konteks, dampak, dan alasan berita ini penting.]

🔗 **Baca lengkap:**
https://www.domain.com/path/artikel-spesifik

Jika tersedia sumber cross-check penting:

🔗 **Referensi tambahan:**
https://www.domainlain.com/path/artikel-spesifik

---

JANGAN mengganti URL dengan nama media.

JANGAN menghilangkan URL.

JANGAN hanya menampilkan headline.

---

# STRUKTUR OUTPUT

Gunakan urutan:

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

## 🔎 YANG PERLU DIPANTAU HARI INI

[Beberapa poin]

## 💡 INSIGHT UNTUK MRK

[2–5 insight]

---

# TELEGRAM DELIVERY

Hasil utama harus dikirim langsung ke percakapan Telegram.

Jika briefing terlalu panjang:

pecah menjadi beberapa pesan.

Gunakan pembagian seperti:

BAGIAN 1/N — 🇮🇩 Indonesia

BAGIAN 2/N — 🌍 Dunia

BAGIAN 3/N — 🤖 AI & Teknologi

BAGIAN 4/N — 💰 Keuangan

BAGIAN 5/N — 🎯 Rotasi + Insight

Jika satu kategori masih terlalu panjang:

pecah kategori tersebut lagi.

Lebih baik mengirim beberapa pesan lengkap daripada satu pesan yang terlalu ringkas.

JANGAN:

- mengurangi jumlah berita hanya karena pesan panjang;
- memendekkan ringkasan menjadi satu kalimat;
- menghapus URL;
- mengganti briefing dengan meta-summary.

---

# DILARANG MEMBUAT BACKUP FILE SECARA DEFAULT

JANGAN membuat file backup.

JANGAN menyimpan briefing ke file lokal secara otomatis.

JANGAN membuat folder briefing secara otomatis.

JANGAN menulis output ke:

- `/opt/data/`
- `/workspace/`
- `/tmp/`
- folder lain;

kecuali MRK secara eksplisit meminta hasil disimpan sebagai file.

JANGAN menawarkan:

"Mau saya simpan file backup?"

Default workflow adalah:

web search
→ verifikasi
→ briefing lengkap
→ tampilkan langsung ke Telegram.

Tidak ada file output dalam workflow normal.

---

# JANGAN BEKERJA DI BACKGROUND

Skill ini harus menyelesaikan pekerjaan pada request yang sedang berjalan.

JANGAN mengatakan:

- "sedang berjalan di background";
- "saya akan mengirim nanti";
- "tunggu beberapa menit";
- "saya akan memberitahu setelah selesai";

kecuali benar-benar ada mekanisme asynchronous yang diminta MRK.

Untuk penggunaan normal:

selesaikan riset dan kirim briefing pada turn yang sama.

---

# JANGAN DELEGASIKAN SECARA DEFAULT

Jangan spawn subagent.

Jangan menggunakan delegated agent.

Jangan mendelegasikan hanya karena briefing panjang.

Kerjakan melalui sesi utama.

Delegasi hanya boleh dilakukan jika MRK secara eksplisit meminta:

- gunakan subagent;
- delegasikan;
- gunakan multi-agent;
- atau instruksi setara.

---

# JANGAN MEMBUAT CRON

Skill ini adalah tugas manual.

JANGAN:

- membuat cron;
- membuat scheduler;
- membuat recurring job;
- mengaktifkan Daily News otomatis.

Cron hanya boleh dibuat jika MRK secara eksplisit meminta jadwal otomatis.

---

# YANG PERLU DIPANTAU

Di akhir briefing tambahkan:

## 🔎 YANG PERLU DIPANTAU HARI INI

Berikan perkembangan yang:

- masih berlangsung;
- berpotensi berubah;
- dapat menghasilkan update besar;
- relevan bagi MRK.

Gunakan fakta dari briefing.

Jangan membuat spekulasi liar.

---

# INSIGHT UNTUK MRK

Tambahkan:

## 💡 INSIGHT UNTUK MRK

Berikan 2–5 insight yang relevan dengan:

- pekerjaan;
- Quality Control;
- industri;
- AI;
- otomasi;
- teknologi;
- investasi;
- produktivitas;
- risiko;
- peluang.

Insight harus berasal dari berita yang ditemukan.

---

# FINAL URL VALIDATION

Sebelum jawaban dikirim, untuk setiap berita pastikan:

- [ ] Ada URL lengkap.
- [ ] URL berasal dari web search.
- [ ] URL menuju artikel spesifik.
- [ ] URL bukan homepage.
- [ ] URL bukan nama media.
- [ ] Ringkasan minimal 4 kalimat.
- [ ] Fakta berasal dari sumber.
- [ ] Tanggal masih relevan.

Jika URL tidak tersedia:

HAPUS berita tersebut.

Jangan mengganti URL yang hilang dengan nama media.

Jika ringkasan terlalu pendek:

PERPANJANG menggunakan fakta dari sumber.

---

# FINAL CHECKLIST

Sebelum mengirim jawaban final, pastikan:

- [ ] web_search benar-benar digunakan;
- [ ] beberapa query digunakan;
- [ ] SOURCE LEDGER dibuat internal;
- [ ] berita aktual;
- [ ] setiap berita memiliki URL lengkap;
- [ ] setiap berita memiliki ringkasan 80–150 kata;
- [ ] Hot News Indonesia berisi beberapa berita;
- [ ] Hot News Dunia berisi beberapa berita;
- [ ] AI & Teknologi berisi beberapa berita;
- [ ] Keuangan berisi beberapa berita;
- [ ] topik rotasi berisi beberapa berita jika sumber tersedia;
- [ ] tidak ada URL palsu;
- [ ] tidak ada homepage sebagai pengganti artikel;
- [ ] tidak ada meta-summary;
- [ ] tidak ada file backup default;
- [ ] tidak ada cron;
- [ ] tidak ada subagent;
- [ ] hasil lengkap tampil di Telegram.

Jika checklist gagal pada berita tertentu:

perbaiki atau hapus berita tersebut.

Jika web benar-benar tidak tersedia:

berhenti dan jelaskan kegagalan secara jujur.

---

# CONTOH OUTPUT BENAR

# 📰 DAILY BRIEFING — ASPRI MRK

📅 Senin, 31 Agustus 2026

🕒 Update: 08:30 WIB

## 🇮🇩 HOT NEWS INDONESIA

### 📰 [Judul berita Indonesia pertama]

[Ringkasan 80–150 kata yang menjelaskan apa yang terjadi, pihak yang terlibat, perkembangan terbaru, konteks penting, dan dampaknya.]

🔗 **Baca lengkap:**
https://www.example.com/news/artikel-indonesia-1

---

### 📰 [Judul berita Indonesia kedua]

[Ringkasan 80–150 kata.]

🔗 **Baca lengkap:**
https://www.example.com/news/artikel-indonesia-2

---

### 📰 [Judul berita Indonesia ketiga]

[Ringkasan 80–150 kata.]

🔗 **Baca lengkap:**
https://www.example.com/news/artikel-indonesia-3

---

## 🌍 HOT NEWS DUNIA

### 📰 [Judul]

[Ringkasan lengkap.]

🔗 **Baca lengkap:**
https://...

---

## 🤖 AI & TEKNOLOGI

### 📰 [Judul]

[Ringkasan lengkap.]

🔗 **Baca lengkap:**
https://...

---

## 💰 KEUANGAN, EKONOMI & INVESTASI

### 📰 [Judul]

[Ringkasan lengkap.]

🔗 **Baca lengkap:**
https://...

---

## 🎯 TOPIK ROTASI HARIAN

### 📰 [Judul]

[Ringkasan lengkap.]

🔗 **Baca lengkap:**
https://...

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

"Berita terverifikasi. Briefing siap dikirim."

JANGAN menghasilkan:

"Ringkasan hasil:
- Indonesia ...
- Dunia ...
- AI ..."

JANGAN menghasilkan:

"Sumber: Reuters / Kompas"

JANGAN menghasilkan:

"Output lengkap sudah dikirim."

JANGAN menghasilkan:

"File tersimpan di /opt/data/..."

JANGAN menghasilkan:

"Saya sedang memproses di background."

JANGAN menghasilkan berita dengan:

[Reuters]

sebagai pengganti URL.

Semua pola tersebut dianggap GAGAL.

---

# CORE WORKFLOW

Workflow default skill ini adalah:

`web_search`

→ buat SOURCE LEDGER internal

→ `web_extract` bila diperlukan

→ verifikasi fakta

→ cross-check jika perlu

→ susun beberapa berita

→ ringkasan 80–150 kata per berita

→ tempel URL lengkap dari SOURCE LEDGER

→ kirim briefing lengkap langsung ke Telegram

Tidak ada:

- cron;
- subagent;
- background processing;
- backup file;
- meta-summary;

kecuali MRK secara eksplisit meminta hal tersebut.