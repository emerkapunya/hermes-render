---
name: daily-news-briefing
description: Membuat briefing berita terkini Indonesia dan dunia dengan web search, verifikasi sumber, ringkasan satu paragraf, dan URL artikel asli.
version: 1.0.0
author: MRK
---

# Daily News Briefing — Aspri MRK

## Tujuan

Gunakan skill ini ketika MRK meminta:

- briefing berita;
- berita terbaru;
- hot news;
- update berita hari ini;
- update AI dan keuangan;
- daily news;
- berita Indonesia dan dunia.

Tugas ini harus dijalankan pada sesi percakapan saat ini.

JANGAN membuat cron.
JANGAN mendelegasikan pekerjaan ini ke subagent kecuali MRK secara eksplisit memintanya.

---

# WAJIB WEB SEARCH

Sebelum membuat briefing:

1. WAJIB gunakan `web_search`.
2. Gunakan beberapa query yang berbeda.
3. Prioritaskan berita maksimal 24 jam terakhir.
4. Untuk breaking news, prioritaskan beberapa jam terakhir.
5. Gunakan `web_extract` pada sumber penting jika tersedia.
6. Jangan membuat berita berdasarkan pengetahuan internal model saja.

Jika web_search tidak berhasil:

BERHENTI.

Katakan kepada MRK:

"Web search tidak berhasil dijalankan sehingga saya tidak akan membuat briefing yang belum terverifikasi."

JANGAN mengarang berita.

---

# Cakupan

## 1. Hot News Indonesia

Cari perkembangan paling penting di Indonesia:

- nasional;
- ekonomi;
- kebijakan;
- industri;
- teknologi;
- bencana;
- peristiwa besar;
- isu lain yang berdampak luas.

## 2. Hot News Dunia

Prioritaskan:

- geopolitik;
- konflik;
- ekonomi global;
- keamanan;
- energi;
- teknologi;
- perubahan kebijakan besar;
- peristiwa internasional penting.

## 3. Artificial Intelligence & Teknologi

Cari perkembangan terbaru mengenai:

- OpenAI;
- Anthropic;
- Google;
- Meta;
- NVIDIA;
- AI agent;
- model AI baru;
- open-source AI;
- otomasi;
- hardware AI;
- penelitian;
- regulasi AI.

## 4. Keuangan, Ekonomi & Investasi

Cari perkembangan:

- IHSG;
- rupiah;
- saham;
- suku bunga;
- inflasi;
- emas;
- komoditas;
- ekonomi Indonesia;
- ekonomi global;
- bank sentral;
- investasi.

## 5. Topik Rotasi

Gunakan hari lokal Asia/Jakarta:

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
Industri, energi, pertambangan, bauksit, alumina dan hilirisasi

---

# Validasi Berita

Sebelum sebuah berita dimasukkan:

1. Pastikan artikel benar-benar ditemukan melalui web_search.
2. Periksa tanggal publikasi.
3. Pastikan artikel membahas berita yang disebutkan.
4. Verifikasi angka penting.
5. Periksa nama orang, perusahaan dan institusi.
6. Periksa konsistensi fakta.
7. Gunakan sumber tambahan jika fakta terlihat meragukan.
8. Untuk berita besar, cross-check dengan sumber lain jika tersedia.

Jika tidak bisa diverifikasi:

JANGAN masukkan berita tersebut.

---

# Aturan Sumber

Prioritas:

1. sumber resmi;
2. Reuters / AP / AFP;
3. media nasional atau internasional bereputasi;
4. media spesialis yang kredibel.

Hindari sebagai sumber utama:

- Facebook;
- posting media sosial tidak resmi;
- homepage media;
- agregator berita;
- situs yang tidak mempunyai artikel spesifik.

URL wajib menuju artikel yang relevan.

JANGAN menebak URL.

---

# Format Output

Awali dengan:

📰 DAILY BRIEFING — ASPRI MRK

📅 [Hari, tanggal]
🕒 Update: [jam WIB]

Kemudian:

## 🇮🇩 HOT NEWS INDONESIA

### 📰 [Judul]

[Ringkasan SATU paragraf. Jelaskan apa yang terjadi, konteks, perkembangan terbaru, dan mengapa hal tersebut penting.]

🔗 Baca lengkap:
[URL artikel]

Jika perlu:

🔗 Referensi tambahan:
[URL kedua]

---

Gunakan format yang sama untuk:

🌍 HOT NEWS DUNIA

🤖 AI & TEKNOLOGI

💰 KEUANGAN, EKONOMI & INVESTASI

🎯 TOPIK ROTASI HARIAN

---

# Jumlah Berita

Tidak ada jumlah berita tetap.

Masukkan semua berita yang:

- benar-benar penting;
- aktual;
- relevan;
- berhasil diverifikasi.

Jangan menambah berita hanya untuk memenuhi jumlah.

Jangan mengulang berita dengan substansi sama.

---

# Penutup

Tambahkan:

## 🔎 YANG PERLU DIPANTAU

Berikan perkembangan yang berpotensi berubah sepanjang hari.

## 💡 INSIGHT UNTUK MRK

Berikan 2–5 insight praktis mengenai:

- pekerjaan;
- industri;
- AI;
- investasi;
- peluang;
- risiko;
- produktivitas.

---

# Larangan Penting

JANGAN:

- hanya mengatakan "laporan selesai";
- hanya memberikan lokasi file;
- mengganti laporan lengkap dengan ringkasan meta;
- mengatakan web_search digunakan jika sebenarnya tidak digunakan;
- membuat URL sendiri;
- membuat fakta sendiri;
- menyimpan hasil ke file sebagai pengganti jawaban Telegram.

Hasil utama harus dikirim langsung dalam percakapan Telegram.

Jika terlalu panjang, pecah hasil menjadi beberapa pesan.
