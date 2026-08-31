# LONG-TERM MEMORY — ASPRI MRK

Dokumen ini menyimpan konteks sistem, keputusan arsitektur, dan pelajaran penting yang perlu dipertahankan lintas sesi.

Informasi profil pengguna sebaiknya disimpan di USER.md.

Detail prosedur suatu tugas sebaiknya disimpan sebagai SKILL.

---

# Agent Identity

- Nama agent adalah **Aspri MRK**.
- Framework utama adalah **Hermes Agent**.
- Bahasa utama komunikasi adalah Bahasa Indonesia.
- Telegram digunakan sebagai salah satu antarmuka utama pengguna.

---

# Deployment Architecture

Deployment Aspri MRK menggunakan:

- GitHub untuk source code dan konfigurasi dasar;
- Render untuk menjalankan service/container;
- Telegram sebagai antarmuka percakapan;
- OpenRouter sebagai provider model AI.

Prioritas operasional adalah menggunakan layanan dan model gratis selama memungkinkan.

---

# Hermes Data Structure

HERMES_HOME:

`/opt/data`

Lokasi canonical:

## SOUL

`/opt/data/SOUL.md`

## USER

`/opt/data/memories/USER.md`

## MEMORY

`/opt/data/memories/MEMORY.md`

## Config

`/opt/data/config.yaml`

## Cron

`/opt/data/cron/`

## Skills

`/opt/data/skills/`

## Sessions

`/opt/data/sessions/`

## Logs

`/opt/data/logs/`

Alias tersedia:

`/opt/data/USER.md`

→ `/opt/data/memories/USER.md`

`/opt/data/MEMORY.md`

→ `/opt/data/memories/MEMORY.md`

---

# Persistence Strategy

Render Free dapat membuat filesystem runtime berubah atau kembali ke kondisi image setelah restart/redeploy.

Karena itu:

- SOUL.md disimpan di GitHub;
- USER.md disimpan di GitHub;
- MEMORY.md disimpan di GitHub;
- custom skills disimpan di GitHub;
- konfigurasi dasar disimpan di GitHub.

Docker build memasukkan file-file tersebut kembali ke container.

Memory baru yang hanya ditulis saat runtime belum dapat dianggap permanen sampai persistence eksternal diterapkan.

Jangan mengklaim runtime memory permanen tanpa memverifikasinya setelah restart/redeploy.

---

# System Verification Lesson

Pernah terjadi Aspri menyatakan USER.md dan MEMORY.md tidak ditemukan karena hanya mencari di root `/opt/data`.

Lokasi yang benar adalah:

`/opt/data/memories/USER.md`

dan:

`/opt/data/memories/MEMORY.md`

Karena itu setiap pengecekan file harus menggunakan lokasi canonical sebelum menyimpulkan file hilang.

---

# Tool Verification Lesson

Pernah terjadi respons sistem menyatakan kondisi file, cron, atau web search berdasarkan asumsi tanpa benar-benar menggunakan tool.

Keputusan:

Untuk status aktual:

- filesystem;
- cron;
- konfigurasi;
- service;
- internet;
- berita;
- data dinamis;

Aspri harus menggunakan tool yang relevan sebelum menyimpulkan.

---

# News Briefing Architecture Decision

Sebelumnya Daily News & AI-Finance Digest dijalankan melalui Hermes Cron.

Metode tersebut dihentikan karena pada salah satu eksekusi:

- subagent tidak menjalankan web_search;
- API calls tercatat 0;
- output hanya berupa pesan meta;
- briefing lengkap tidak dikirim ke Telegram;
- agent menyatakan pekerjaan selesai walaupun output tidak sesuai;
- backup file mencoba menggunakan path yang salah.

Keputusan sistem saat ini:

**Daily News Briefing tidak dijalankan melalui cron otomatis.**

Briefing dijalankan secara manual ketika MRK meminta.

Workflow briefing menggunakan custom skill:

`daily-news-briefing`

Lokasi:

`/opt/data/skills/daily-news-briefing/SKILL.md`

---

# Daily News Skill Policy

Skill `daily-news-briefing` digunakan untuk:

- Hot News Indonesia;
- Hot News Dunia;
- Artificial Intelligence;
- Teknologi;
- Keuangan;
- Ekonomi;
- Investasi;
- topik minat tambahan MRK.

Skill harus:

- menggunakan web search;
- melakukan verifikasi;
- menggunakan artikel spesifik;
- menyertakan URL sumber;
- memberikan satu paragraf ringkasan setiap berita;
- mengirim hasil langsung ke percakapan.

Skill tidak boleh hanya menghasilkan pesan:

"laporan selesai"

atau:

"file telah dibuat".

---

# Cron Policy

Tidak ada cron berita otomatis yang harus dibuat saat startup.

Jangan membuat kembali:

`Daily News & AI-Finance Digest`

sebagai cron kecuali MRK secara eksplisit meminta cron tersebut dibuat kembali.

Cron dapat digunakan di masa depan untuk tugas yang:

- sederhana;
- deterministik;
- tidak membutuhkan agent reasoning kompleks;
- tidak membutuhkan riset web multi-langkah yang rawan menyimpang.

---

# Delegation Lesson

Subagent tidak selalu mengikuti workflow panjang dengan disiplin yang sama seperti sesi utama, khususnya ketika menggunakan model gratis atau router model dinamis.

Karena itu:

- jangan mendelegasikan tugas penting secara otomatis;
- jangan mempercayai laporan subagent tanpa verifikasi;
- hasil tugas harus diperiksa sebelum diklaim berhasil.

Untuk briefing berita, gunakan sesi utama kecuali pengguna meminta delegasi.

---

# Model Strategy

Provider utama:

OpenRouter.

Model gratis diprioritaskan.

Karena model gratis dapat:

- berubah;
- terkena rate limit;
- memiliki kemampuan tool calling yang berbeda;
- memiliki tingkat kepatuhan berbeda;

workflow penting tidak boleh bergantung pada asumsi bahwa semua model akan berperilaku sama.

Instruksi penting harus:

- sederhana;
- eksplisit;
- dapat diverifikasi melalui tool.

---

# Memory Policy

Simpan ke long-term memory hanya informasi yang kemungkinan masih berguna di masa depan.

Prioritaskan:

- keputusan sistem;
- perubahan arsitektur;
- workflow;
- hasil eksperimen;
- pelajaran dari error;
- konfigurasi stabil;
- preferensi jangka panjang.

Jangan menyimpan:

- API key;
- token;
- password;
- OTP;
- credential;
- session secret;
- informasi autentikasi.

---

# System Design Principle

Arsitektur Aspri MRK mengikuti prinsip:

**SOUL**
menentukan siapa agent dan bagaimana dia berperilaku.

**USER**
menentukan siapa MRK dan apa preferensinya.

**MEMORY**
menyimpan keputusan dan pembelajaran jangka panjang.

**SKILLS**
menyimpan prosedur untuk tugas tertentu.

**TOOLS**
digunakan untuk mendapatkan hasil aktual.

Hindari menduplikasi isi panjang antar file.

Setiap informasi sebaiknya ditempatkan pada file yang paling sesuai.

---

# Core Reliability Principles

1. Jangan mengarang hasil.
2. Jangan mengklaim tool digunakan jika sebenarnya tidak.
3. Jangan mengklaim pekerjaan selesai sebelum hasil diverifikasi.
4. Gunakan kondisi aktual untuk pemeriksaan sistem.
5. Gunakan web search untuk informasi terkini.
6. Bedakan fakta dengan asumsi.
7. Prioritaskan reliability dibanding respons yang terlihat meyakinkan.
8. Jika gagal, jelaskan kegagalan secara jelas daripada membuat hasil palsu.
