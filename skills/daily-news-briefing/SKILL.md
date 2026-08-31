---
name: daily-news-briefing
description: Membuat briefing berita terkini Indonesia dan dunia menggunakan web search aktual, verifikasi sumber, ringkasan satu paragraf, dan URL artikel asli.
version: 2.0.0
author: MRK
---

# DAILY NEWS BRIEFING — ASPRI MRK

## Tujuan

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
- perkembangan terkini.

Skill ini dijalankan pada sesi percakapan utama.

JANGAN membuat cron.

JANGAN mendelegasikan tugas ini ke subagent kecuali MRK secara eksplisit meminta delegasi.

---

# PRINCIP UTAMA

Berita terkini harus berdasarkan informasi aktual dari internet.

Pengetahuan internal model TIDAK boleh digunakan sebagai satu-satunya sumber untuk berita terkini.

WAJIB gunakan tool web.

Tidak boleh mengarang:
- berita;
- angka;
- tanggal;
- nama;
- kutipan;
- fakta;
- sumber;
- URL.

Jika berita tidak berhasil diverifikasi, jangan masukkan ke briefing.

---

# WEB SEARCH POLICY

## Provider Independence

Skill ini TIDAK bergantung pada Tavily, Firecrawl, Exa, Brave, DDGS, atau provider tertentu.

Jangan mengunci proses pencarian pada nama backend tertentu.

Gunakan tool:

`web_search`

yang tersedia di Hermes pada saat eksekusi.

Yang penting adalah tool web berhasil memberikan hasil aktual.

---

# RESEARCH FLOW

Untuk setiap briefing:

1. Gunakan `web_search`.
2. Lakukan beberapa pencarian berbeda sesuai kategori.
3. Prioritaskan berita dari 24 jam terakhir.
4. Untuk breaking news, prioritaskan perkembangan beberapa jam terakhir.
5. Gunakan `web_extract` jika tersedia untuk membaca artikel penting.
6. Cross-check informasi penting jika diperlukan.
7. Verifikasi tanggal publikasi.
8. Verifikasi angka, nama, perusahaan, institusi, dan fakta utama.
9. Pastikan URL mengarah ke artikel yang relevan.
10. Buang berita yang tidak dapat diverifikasi.

Jangan hanya melakukan satu query untuk seluruh briefing.

---

# JIKA WEB SEARCH GAGAL

Jika `web_search` pertama gagal:

1. coba ulang dengan query yang lebih sederhana;
2. coba query alternatif;
3. coba kategori lain;
4. gunakan fallback backend jika Hermes menyediakannya;
5. jangan langsung menyimpulkan seluruh web search mati hanya karena satu provider gagal.

Jika setelah beberapa percobaan yang wajar tool web tetap tidak tersedia:

BERHENTI.

Katakan kepada MRK:

"Web search saat ini tidak tersedia sehingga saya tidak akan membuat briefing yang belum terverifikasi."

JANGAN menggunakan pengetahuan internal sebagai pengganti.

JANGAN membuat URL palsu.

JANGAN mengatakan web search berhasil jika tool tidak menghasilkan hasil.

---

# CAKUPAN BERITA

## 1. HOT NEWS INDONESIA

Cari perkembangan paling penting di Indonesia.

Prioritaskan jika relevan:

- nasional;
- ekonomi;
- kebijakan;
- industri;
- teknologi;
- energi;
- bencana;
- keamanan;
- sosial;
- peristiwa besar;
- isu yang berdampak luas.

---

## 2. HOT NEWS DUNIA

Cari perkembangan internasional paling penting.

Prioritaskan:

- geopolitik;
- konflik;
- diplomasi;
- ekonomi global;
- energi;
- keamanan;
- teknologi;
- kebijakan besar;
- bencana;
- perkembangan global signifikan.

---

## 3. ARTIFICIAL INTELLIGENCE & TEKNOLOGI

Cari perkembangan terbaru mengenai:

- OpenAI;
- Google;
- Anthropic;
- Meta;
- NVIDIA;
- Microsoft;
- AI Agent;
- model AI baru;
- open-source AI;
- otomasi;
- robotics;
- hardware AI;
- penelitian AI;
- regulasi AI;
- teknologi baru.

Prioritaskan perkembangan yang berdampak pada:
- pekerjaan;
- industri;
- otomasi;
- data;
- produktivitas;
- inovasi.

---

## 4. KEUANGAN, EKONOMI & INVESTASI

Cari perkembangan terbaru mengenai:

- IHSG;
- rupiah;
- saham;
- emas;
- komoditas;
- minyak;
- suku bunga;
- inflasi;
- kebijakan bank sentral;
- ekonomi Indonesia;
- ekonomi global;
- investasi;
- perusahaan besar;
- sektor yang sedang mengalami perubahan signifikan.

Angka keuangan wajib diverifikasi sebelum ditampilkan.

---

# TOPIK ROTASI HARIAN

Gunakan hari lokal:

`Asia/Jakarta`

Rotasi:

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
Industri, energi, pertambangan, bauksit, alumina, aluminium, dan hilirisasi

Topik rotasi adalah tambahan.

Hot News Indonesia, Hot News Dunia, AI/Teknologi, dan Keuangan tetap wajib.

---

# VALIDASI SUMBER

Urutan prioritas sumber:

1. sumber resmi;
2. lembaga pemerintah;
3. perusahaan atau organisasi terkait;
4. Reuters;
5. AP;
6. AFP;
7. media nasional atau internasional bereputasi;
8. media spesialis kredibel.

Untuk topik tertentu, sumber primer lebih disukai.

Contoh:
- BMKG untuk cuaca;
- BI untuk kebijakan moneter;
- BEI untuk informasi pasar tertentu;
- perusahaan untuk pengumuman resmi;
- regulator untuk aturan baru.

---

# SUMBER YANG HARUS DIHINDARI

Jangan gunakan sebagai sumber utama jika ada sumber lebih baik:

- Facebook;
- posting sosial media tidak resmi;
- forum;
- homepage media;
- halaman kategori;
- agregator;
- situs tanpa artikel spesifik.

URL harus mengarah langsung ke sumber atau artikel yang relevan.

---

# CROSS-CHECK

Lakukan cross-check jika:

- berita berdampak besar;
- angka terlihat tidak masuk akal;
- ada konflik informasi;
- berita bersifat sensitif;
- informasi berasal dari satu sumber yang lemah;
- fakta terlihat tidak konsisten.

Jika hasil cross-check bertentangan:

jelaskan ketidakpastiannya atau jangan masukkan berita tersebut.

---

# QUALITY CONTROL

Sebelum memasukkan berita, cek:

- Apakah benar terjadi?
- Apakah tanggalnya relevan?
- Apakah sumbernya valid?
- Apakah angka benar?
- Apakah ringkasan sesuai isi artikel?
- Apakah URL spesifik?
- Apakah berita masih aktual?
- Apakah sudah ada berita lain dengan substansi sama?

Jangan memasukkan berita duplikat.

---

# JUMLAH BERITA

Tidak ada jumlah berita tetap.

Masukkan semua berita yang:

- penting;
- aktual;
- relevan;
- berhasil diverifikasi.

Jangan memperbanyak jumlah dengan berita kecil atau berulang.

Kualitas lebih penting daripada kuantitas.

---

# FORMAT OUTPUT

Awali dengan:

# 📰 DAILY BRIEFING — ASPRI MRK

📅 [Hari, tanggal]

🕒 Update: [jam WIB]

---

## 🇮🇩 HOT NEWS INDONESIA

### 📰 [Judul berita]

[Ringkasan SATU paragraf yang menjelaskan:
apa yang terjadi, konteks, perkembangan terbaru, dan mengapa berita ini penting.]

🔗 **Baca lengkap:**
[URL artikel]

Jika ada sumber kedua yang relevan:

🔗 **Referensi tambahan:**
[URL]

---

Gunakan format yang sama untuk:

## 🌍 HOT NEWS DUNIA

## 🤖 AI & TEKNOLOGI

## 💰 KEUANGAN, EKONOMI & INVESTASI

## 🎯 TOPIK ROTASI HARIAN

---

# RINGKASAN SETIAP BERITA

Setiap berita harus memiliki satu paragraf ringkasan.

Ringkasan sebaiknya mencakup:

1. apa yang terjadi;
2. perkembangan terbaru;
3. konteks penting;
4. dampak atau alasan berita tersebut relevan.

Jangan hanya mengulang headline.

---

# URL POLICY

Setiap berita WAJIB memiliki minimal satu URL.

URL harus:

- berasal dari hasil web search;
- valid;
- spesifik;
- relevan dengan berita.

JANGAN membuat URL sendiri.

Jika artikel spesifik tidak ditemukan:

JANGAN masukkan berita tersebut.

---

# TELEGRAM DELIVERY

Hasil briefing utama harus dikirim langsung ke percakapan Telegram.

JANGAN hanya:

- membuat file;
- memberi path file;
- mengatakan "laporan selesai";
- mengirim daftar headline tanpa isi;
- mengirim pesan meta tentang pekerjaan.

Jika hasil terlalu panjang:

pecah menjadi beberapa pesan.

Gunakan format:

BAGIAN 1/N

BAGIAN 2/N

dan seterusnya.

Usahakan pemisahan berdasarkan kategori.

---

# FILE OUTPUT

File lokal boleh dibuat sebagai backup jika diperlukan.

Jika file dibuat, gunakan lokasi aman di bawah:

`/opt/data/`

Contoh:

`/opt/data/briefings/`

Tetapi file lokal TIDAK BOLEH menggantikan pengiriman hasil ke Telegram.

---

# YANG PERLU DIPANTAU

Di akhir briefing tambahkan:

## 🔎 YANG PERLU DIPANTAU HARI INI

Berikan perkembangan yang:

- masih berlangsung;
- berpotensi berubah cepat;
- mungkin menghasilkan update besar pada hari tersebut.

---

# INSIGHT UNTUK MRK

Tambahkan:

## 💡 INSIGHT UNTUK MRK

Berikan sekitar 2–5 insight yang relevan dengan:

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

Insight harus berdasarkan keseluruhan briefing, bukan dibuat secara acak.

---

# FINAL CHECKLIST

Sebelum mengirim hasil akhir, pastikan:

- [ ] web_search benar-benar digunakan;
- [ ] beberapa query digunakan;
- [ ] berita aktual;
- [ ] sumber valid;
- [ ] setiap berita memiliki URL;
- [ ] setiap berita memiliki ringkasan satu paragraf;
- [ ] Hot News Indonesia ada;
- [ ] Hot News Dunia ada;
- [ ] AI & Teknologi ada;
- [ ] Keuangan/Ekonomi/Investasi ada;
- [ ] topik rotasi ada;
- [ ] tidak ada URL yang dibuat-buat;
- [ ] tidak ada berita yang tidak terverifikasi;
- [ ] output lengkap dikirim ke Telegram;
- [ ] output bukan sekadar pesan meta.

Jika checklist gagal pada berita tertentu:

hapus berita tersebut atau perbaiki sebelum mengirim.

---

# LARANGAN

JANGAN:

- membuat cron;
- mendelegasikan briefing tanpa permintaan MRK;
- mengatakan sedang bekerja di background jika tidak ada proses nyata;
- membuat klaim tool palsu;
- membuat berita palsu;
- membuat URL palsu;
- menyimpulkan web mati hanya karena satu provider gagal;
- menggunakan pengetahuan internal sebagai pengganti web search aktual;
- mengklaim selesai sebelum hasil lengkap benar-benar dikirim.