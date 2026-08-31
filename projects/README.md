# ASPRI MRK — PROJECT WORKSPACE

Folder ini digunakan untuk menyimpan context project secara terpisah agar informasi antarproject tidak tercampur.

## Struktur Project

Setiap project idealnya menggunakan folder:

`projects/<project-slug>/`

Dengan file:

- `PROJECT.md` — tujuan, scope, stakeholder, constraint, arsitektur, keputusan utama
- `MEMORY.md` — keputusan dan context stabil khusus project
- `TASKS.md` — task aktif, backlog, status, next action

Contoh:

```text
projects/
├── labagent/
│   ├── PROJECT.md
│   ├── MEMORY.md
│   └── TASKS.md
├── automation-lab/
│   ├── PROJECT.md
│   ├── MEMORY.md
│   └── TASKS.md
└── research/
    ├── PROJECT.md
    ├── MEMORY.md
    └── TASKS.md
```

## Aturan

1. Jangan mencampur project memory ke global MEMORY.md kecuali merupakan keputusan sistem global.
2. Saat MRK berkata `buka project X`, gunakan context project tersebut.
3. Jika project belum ada, jangan membuatnya tanpa permintaan eksplisit.
4. Untuk delete/rename project, minta konfirmasi karena merupakan perubahan persisten.
5. Menu Projects hanya navigasi; natural-language request tetap didukung.