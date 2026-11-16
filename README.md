# MyPortfolio Mobile

Aplikasi mobile multiplatform berbasis **Flutter** untuk portofolio pribadi pada mata kuliah **Pemrograman Berbasis Platform (CSGE602022)**, Fakultas Ilmu Komputer Universitas Indonesia, Semester Gasal 2026/2027.

Aplikasi ini dirancang dengan palet warna **Blaugrana** (terinspirasi dari FC Barcelona: biru `#004D98`, merah marun `#A50044`, dan aksen emas `#EDBB00`) menggunakan **Material 3**.

---

## Fitur Utama

- **Identitas Pemilik Portofolio (`InfoCard`)**: Menampilkan NPM, Nama Lengkap, dan Kelas PBP secara responsif di bagian atas halaman.
- **Banner Profil Blaugrana & Dialog Info**: Menampilkan avatar inisial otomatis serta tombol informasi di `AppBar` untuk melihat ringkasan aplikasi.
- **Menu Aksi Portofolio (`ItemCard`)**: Kisi 3 kolom berisi 6 tombol aksi (`Lihat Proyek`, `Tambah Proyek`, `Lihat Education`, `Lihat Skills`, `Lihat Experience`, dan `Logout`), masing-masing dengan warna latar unik yang kontras dan umpan balik `SnackBar` interaktif.
- **Tech Stack Badges**: Ringkasan teknologi yang digunakan pada proyek.

---

## Palet Warna (Blaugrana Theme & Menu Aksi)

| Elemen / Tombol | Nama Warna | Kode Hex |
| :--- | :--- | :--- |
| Primary / `Lihat Proyek` | Barça Blue | `#004D98` |
| Secondary / `Tambah Proyek` | Barça Garnet | `#A50044` |
| `Lihat Education` | Camp Nou Emerald | `#0D7A5F` |
| `Lihat Skills` | Barça Crest Gold / Amber | `#D97706` |
| `Lihat Experience` | Blaugrana Indigo | `#4F46E5` |
| `Logout` | Crimson Red | `#DC2626` |
| Accent / Avatar | Barça Gold | `#EDBB00` |
| Surface Background | Cool Light | `#F5F7FB` |

---

## Struktur Proyek

```text
myportofolio_mobile/
├── lib/
│   ├── main.dart        # Entry point aplikasi & konfigurasi ThemeData (Material 3)
│   └── menu.dart        # Halaman utama (MyHomePage), InfoCard, ItemHomepage, ItemCard
├── test/
│   └── widget_test.dart # Widget test untuk halaman utama dan interaksi SnackBar
├── pubspec.yaml         # Manifes proyek dan dependensi Flutter
└── README.md            # Dokumentasi proyek, progres mingguan, dan jawaban reflektif
```

---

## Panduan Setup & Menjalankan Aplikasi

1. **Pastikan Flutter SDK terpasang** dan terdaftar di `PATH`:
   ```bash
   flutter doctor
   ```
2. **Clone repositori** dan masuk ke direktori proyek:
   ```bash
   git clone https://github.com/yazidkhairul-tech/myportofolio_mobile.git
   cd myportofolio_mobile
   ```
3. **Unduh dependensi**:
   ```bash
   flutter pub get
   ```
4. **Jalankan analisis statis & pengujian**:
   ```bash
   flutter analyze
   flutter test
   ```
5. **Jalankan aplikasi** (di Google Chrome atau emulator Android):
   ```bash
   flutter run -d chrome
   ```

---

## Progres Mingguan

- **Tutorial 08 (Basic Flutter)**: Inisialisasi proyek `myportofolio_mobile`, pemisahan `menu.dart` dari `main.dart`, konversi `MyHomePage` menjadi `StatelessWidget`, serta pembuatan `InfoCard` dan `ItemCard` untuk profil contoh Burhan.
- **Individual Assignment 7 (Basic Flutter)**: Kustomisasi identitas pribadi pada `InfoCard`, perluasan menu `ItemCard` dengan 6 warna latar berbeda yang kontras, penerapan tema warna Blaugrana, penambahan banner profil, dialog informasi, `SingleChildScrollView`, serta pembaruan widget test dan dokumentasi.

---

## Pertanyaan Reflektif

### Tugas 7

1. **Widget Tree dan Hubungan Induk-Anak (Parent-Child) pada Flutter**
   Widget tree adalah struktur pohon hierarkis yang merepresentasikan seluruh elemen antarmuka pengguna (UI) di Flutter, mulai dari konfigurasi tema hingga komponen terkecil seperti teks dan ikon. Dalam hubungan *parent-child*, widget induk (*parent*) bertindak sebagai pengatur tata letak, batasan ukuran (*constraints*), tema, atau pembungkus perilaku bagi widget anak (*child* atau *children*). Widget induk meneruskan *constraints* ke bawah ke anak-anaknya, sementara widget anak menentukan ukurannya sendiri dalam batas tersebut dan mengembalikannya ke induk untuk diposisikan di layar. Contohnya pada proyek ini, `Scaffold` menjadi induk bagi `AppBar` dan `SingleChildScrollView`, lalu `Column` mengatur susunan vertikal `Row` (yang berisi tiga `InfoCard`) dan `GridView.count` (yang berisi daftar `ItemCard`).

2. **Daftar Widget yang Digunakan dan Fungsinya**
   - `MaterialApp`: Root widget yang mengatur konfigurasi global aplikasi seperti judul, tema Material 3 (`ThemeData`), dan halaman awal (`home`).
   - `Scaffold`: Kerangka visual standar Material Design yang menyediakan struktur dasar halaman (`appBar`, `body`) serta dukungan `ScaffoldMessenger` untuk menampilkan `SnackBar`.
   - `AppBar`: Bilah judul di bagian atas halaman yang menampilkan ikon, teks judul `'MyPortfolio'`, dan tombol aksi.
   - `IconButton`: Tombol berbasis ikon di `AppBar` untuk memicu dialog informasi aplikasi.
   - `AlertDialog` & `TextButton`: Jendela pop-up untuk menampilkan informasi singkat aplikasi beserta tombol penutupnya.
   - `SingleChildScrollView`: Pembungkus *body* agar seluruh konten dapat digulir sehingga aman dari *overflow* pada layar berukuran kecil.
   - `Padding`: Memberikan jarak ruang (*spacing*) di sekitar widget anak.
   - `Container`: Wadah serbaguna untuk mengatur dekorasi (`BoxDecoration`, gradien, *border radius*, bayangan), warna, tinggi/lebar, dan *padding*.
   - `CircleAvatar`: Menampilkan lingkaran avatar berisi inisial nama pemilik portofolio.
   - `Column` & `Row`: Mengatur tata letak widget anak secara vertikal (`Column`) maupun horizontal (`Row`).
   - `Expanded`: Membagi ruang tersisa secara proporsional di dalam `Row` untuk ketiga `InfoCard`.
   - `SizedBox`: Memberikan jarak tetap (vertikal atau horizontal) antar-widget.
   - `Center`: Memusatkan posisi widget anak di dalam ruang yang tersedia.
   - `Card`: Kartu Material Design dengan elevasi dan sudut membulat untuk membungkus `InfoCard`.
   - `GridView.count`: Menyusun daftar `ItemCard` ke dalam tata letak kisi dengan jumlah kolom tetap (`crossAxisCount: 3`).
   - `Material`: Menyediakan kanvas Material dengan warna latar, elevasi, dan `borderRadius` agar efek riak sentuhan (`InkWell`) tampil rapi.
   - `InkWell`: Menangani interaksi ketukan (`onTap`) sekaligus memberikan animasi *ripple effect* Material.
   - `SnackBar`: Menampilkan notifikasi singkat di bagian bawah layar saat salah satu `ItemCard` ditekan.
   - `Wrap`: Menyusun kumpulan badge teknologi (`_TechBadge`) secara fleksibel dan otomatis berpindah baris jika ruang horizontal penuh.
   - `Icon` & `Text`: Menampilkan ikon Material dan teks dengan gaya tipografi tertentu.
   - Custom Widgets (`MyApp`, `MyHomePage`, `InfoCard`, `ItemCard`, `_TechBadge`): Komponen modular buatan sendiri untuk menjaga keterbacaan dan penggunaan ulang kode.

3. **Fungsi `MaterialApp` dan Alasannya Sebagai Root Widget**
   `MaterialApp` berfungsi sebagai pembungkus tingkat atas yang menyediakan layanan dan konfigurasi inti aplikasi berbasis Material Design, meliputi manajemen tema (`ThemeData` dan `ColorScheme`), sistem navigasi dan *routing*, lokalisasi teks, serta `ScaffoldMessenger` dan `Navigator` bawaan. Widget ini umumnya diletakkan sebagai *root widget* agar seluruh turunan di dalam *widget tree* dapat mengakses konteks tema (`Theme.of(context)`), navigasi, dan arah teks secara konsisten tanpa perlu mendefinisikannya berulang kali di setiap halaman.

4. **Perbedaan `StatelessWidget` dan `StatefulWidget`**
   - `StatelessWidget` adalah widget yang bersifat *immutable* (tidak memiliki *state* internal yang berubah selama masa hidupnya). Tampilannya hanya bergantung pada konfigurasi parameter yang diberikan saat konstruksi atau perubahan dari widget induknya.
   - `StatefulWidget` adalah widget yang memiliki objek `State` terpisah yang bersifat *mutable* dan dapat diperbarui secara dinamis menggunakan `setState()`, sehingga Flutter akan membangun ulang (*rebuild*) bagian UI yang terdampak saat data berubah.
   - **Kapan memilih masing-masing**: Gunakan `StatelessWidget` untuk antarmuka statis seperti halaman menu portofolio pada tugas ini (`MyHomePage`, `InfoCard`, `ItemCard`) karena lebih ringan dan sederhana. Gunakan `StatefulWidget` ketika widget perlu mengelola data lokal yang berubah akibat interaksi pengguna atau proses asinkron, seperti *form input*, *counter*, animasi lokal, atau data hasil *fetch* API.

5. **Pengertian dan Pentingnya `BuildContext` di Metode `build`**
   `BuildContext` adalah referensi (pegangan/alamat) terhadap posisi suatu widget tertentu di dalam *widget tree*. Objek ini sangat penting karena menjadi jembatan bagi widget untuk berinteraksi dengan widget leluhurnya (*ancestors*) di pohon yang sama. Di dalam metode `build(BuildContext context)`, `context` digunakan untuk mengambil konfigurasi tema terdekat (`Theme.of(context).colorScheme`), menampilkan `SnackBar` melalui `ScaffoldMessenger.of(context)`, maupun membuka dialog lewat `showDialog(context: context, ...)`.

6. **Konsep *Hot Reload* vs *Hot Restart* dan Kapan Harus *Full Restart***
   - **Hot Reload** menyuntikkan perubahan kode Dart yang baru ke dalam Dart Virtual Machine (VM) yang sedang berjalan dan langsung memanggil ulang metode `build` pada *widget tree* dalam hitungan milidetik **tanpa menghapus *state* aplikasi** yang sedang aktif.
   - **Hot Restart** mengompilasi ulang kode aplikasi dari awal dan memulai ulang eksekusi dari fungsi `main()`, sehingga **seluruh *state* aplikasi direset** ke kondisi awal, namun tetap jauh lebih cepat daripada kompilasi ulang penuh.
   - **Kapan tidak cukup dengan *Hot Reload***: Kita perlu melakukan **Hot Restart** saat mengubah fungsi `main()`, mengubah nilai inisialisasi `State`, mengubah variabel global/`static`, atau mengubah struktur tipe kelas (misalnya mengubah `StatelessWidget` menjadi `StatefulWidget`). Kita perlu melakukan **Full Restart** (build ulang dari terminal/IDE) apabila menambahkan dependensi baru di `pubspec.yaml`, menambahkan aset baru, atau memodifikasi kode/konfigurasi native di folder `android/`, `ios/`, `web/`, atau `windows/`.

---

## AI Disclosure

### 1. Tools yang Digunakan
- **Google Antigravity (Gemini)**: Digunakan sebagai asisten *pair-programming* di IDE untuk membantu memverifikasi kode Tutorial 08, merancang palet warna dan komponen UI bertema FC Barcelona (Blaugrana), memperbarui *widget test*, serta menyusun struktur dokumentasi `README.md`.

### 2. Strategi Prompting & Bagian Spesifik yang Dibantu
Strategi prompting dilakukan secara bertahap (*iterative prompting*):
1. **Tahap Verifikasi Fondasi**: Meminta AI memeriksa kesesuaian kode awal `lib/main.dart` dan `lib/menu.dart` terhadap spesifikasi **Tutorial 08: Basic Flutter**.
2. **Tahap Implementasi Fitur & Desain**: Meminta AI mengimplementasikan seluruh checklist **Individual Assignment 7** dengan arahan visual spesifik (*"warna biru merahan seperti Barcelona FC"*) dan menambahkan fitur UI/UX ekstra sesuai target rubrik nilai 4.
3. **Tahap Evaluasi & Audit Rubrik**: Meminta AI melakukan pengecekan silang terhadap seluruh poin rubrik penilaian (Fungsionalitas, Kualitas Kode, Git, serta Dokumentasi & Reflektif).

**Bagian yang dibantu AI:**
- Konfigurasi `ThemeData` Material 3 di `lib/main.dart`.
- Perancangan komponen tambahan di `lib/menu.dart` (banner profil gradien Blaugrana, dialog informasi `AlertDialog`, `SingleChildScrollView`, dan `_TechBadge`).
- Penyesuaian `test/widget_test.dart` agar menguji `InfoCard`, `ItemCard`, dan `SnackBar`.
- Penyusunan draf dokumentasi dan jawaban reflektif di `README.md`.

### 3. Log Prompting (Ringkasan Interaksi)
- **Prompt 1**: *"coba cek apakah semua yang ada di file ini sudah sesuai semua dengan tutorial yang ada disini [teks Tutorial 08]"*
- **Prompt 2**: *"sekarang implementasikan ini, dan buat sebaik mungkin dengan warna yang bagus, lebih ke biru merahan seperti barcelona fc, lengkapi semua checklistnya dan buat ikutin rubrik penilaiannya 4 semua. kasih tau aku kalau sudah perlu di commit [teks Individual Assignment 7]"*
- **Prompt 3**: *"coba cek apakah yang dikerjakan sudah memenuhi semua yang ada di rubrik penilaian ini [teks Individual Assignment 7]"*

### 4. Analisis Kritis Keterbatasan AI & Perbaikan Manual yang Dilakukan
1. **Kontras Warna pada `ItemCard`**: Pada iterasi awal, AI memilih 6 warna yang semuanya merupakan variasi biru tua dan merah marun agar sesuai dengan tema Barcelona FC, namun beberapa warna terlihat agak mirip. Kode diperbaiki agar keenam tombol memiliki warna yang benar-benar unik dan kontras satu sama lain (Biru `#004D98`, Merah Marun `#A50044`, Hijau Zamrud `#0D7A5F`, Emas/Amber `#D97706`, Indigo `#4F46E5`, dan Merah Terang `#DC2626`) sambil tetap mempertahankan identitas Blaugrana pada `AppBar`, banner profil, dan aksen `InfoCard`.
2. **Kesesuaian Aturan Linter (`flutter analyze`)**: AI sempat menggunakan konstruktor `const` pada `ItemHomepage` sementara `MyHomePage` menggunakan konstruktor non-`const`, yang dapat memicu peringatan linter `prefer_const_constructors_in_immutables`. Konstruktor disesuaikan kembali dan `test/widget_test.dart` dilengkapi pengecekan `Icons.folder_rounded` agar tidak terjadi peringatan `unused_import`.
3. **Data Identitas Pribadi**: AI tidak mengetahui NPM, nama lengkap resmi, dan kelas PBP mahasiswa secara otomatis, sehingga variabel `npm`, `nama`, dan `kelas` pada `lib/menu.dart` harus diverifikasi dan diisi secara manual sebelum proses *commit* dan *push*.
