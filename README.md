# Tugas Rutin 6 - Aplikasi Wisata Sumatera Utara

**Nama:** Siti Haliza Zamili
**NIM:** 4241250019
**Kelas:** PSIK 24D

## Deskripsi
Aplikasi panduan wisata Sumatera Utara yang tampil baik di ponsel maupun tablet. Halaman
Jelajah menampilkan grid delapan destinasi yang jumlah kolomnya menyesuaikan lebar layar.
Halaman detail dibuka lewat go_router dengan path parameter (`/destinasi/:id`), dan susunannya
berubah antara layar sempit dan lebar. ID yang tidak dikenal ditampilkan sebagai halaman
"tidak ditemukan". Kerangka navigasi berganti dari NavigationBar ke NavigationRail pada lebar
layar 840 dp ke atas. Data destinasi dan harga tiket hanya contoh untuk latihan.

## Struktur Proyek
```
lib/main.dart            -> WisataApp, router, KerangkaNavigasi
lib/data.dart            -> model Destinasi, data contoh, extension Rupiah
lib/widget_umum.dart     -> LatarDestinasi, LabelKategori
lib/halaman_daftar.dart  -> grid responsif dan KartuDestinasi
lib/halaman_detail.dart  -> detail responsif dan halaman tidak ditemukan
lib/halaman_tentang.dart -> halaman Tentang dengan header Stack
test/widget_test.dart    -> tes buka detail dan tes tanpa overflow
screenshots/             -> tangkapan layar
```

## Cara Menjalankan
```
flutter pub get
flutter run -d chrome
```
Pengujian dan pemeriksaan kode:
```
flutter test
flutter analyze
```

## Tangkapan Layar

### Ponsel (HP Infinix)

**Halaman daftar dan Tentang**
<table>
  <tr>
    <td><img src="screenshots/ponsel-daftar-1.jpeg" width="230"><br><sub>Daftar (atas)</sub></td>
    <td><img src="screenshots/ponsel-daftar-2.jpeg" width="230"><br><sub>Daftar (bawah)</sub></td>
    <td><img src="screenshots/ponsel-tentang.jpeg" width="230"><br><sub>Tentang</sub></td>
  </tr>
</table>

**Halaman detail semua destinasi**
<table>
  <tr>
    <td><img src="screenshots/ponsel-detail-1.jpeg" width="190"><br><sub>Danau Toba</sub></td>
    <td><img src="screenshots/ponsel-detail-2.jpeg" width="190"><br><sub>Bukit Lawang</sub></td>
    <td><img src="screenshots/ponsel-detail-3.jpeg" width="190"><br><sub>Istana Maimun</sub></td>
    <td><img src="screenshots/ponsel-detail-4.jpeg" width="190"><br><sub>Berastagi</sub></td>
  </tr>
  <tr>
    <td><img src="screenshots/ponsel-detail-5.jpeg" width="190"><br><sub>Air Terjun Sipiso-piso</sub></td>
    <td><img src="screenshots/ponsel-detail-6.jpeg" width="190"><br><sub>Masjid Raya Al Mashun</sub></td>
    <td><img src="screenshots/ponsel-detail-7.jpeg" width="190"><br><sub>Tjong A Fie Mansion</sub></td>
    <td><img src="screenshots/ponsel-detail-8.jpeg" width="190"><br><sub>Pantai Cermin</sub></td>
  </tr>
</table>

### Tablet (simulasi di Chrome, lebar 1024 dp)
<table>
  <tr>
    <td><img src="screenshots/chrome-1024.jpeg" width="400"><br><sub>Daftar: NavigationRail dan 4 kolom</sub></td>
    <td><img src="screenshots/chrome-detail-1.jpeg" width="400"><br><sub>Detail: gambar dan info berdampingan</sub></td>
    <td><img src="screenshots/chrome-detail-2.jpeg" width="400"><br><sub>Detail: gambar dan info berdampingan</sub></td>
    <td><img src="screenshots/chrome-detail-3.jpeg" width="400"><br><sub>Detail: gambar dan info berdampingan</sub></td>
    <td><img src="screenshots/chrome-detail-4.jpeg" width="400"><br><sub>Detail: gambar dan info berdampingan</sub></td>
    <td><img src="screenshots/chrome-detail-5.jpeg" width="400"><br><sub>Detail: gambar dan info berdampingan</sub></td>
    <td><img src="screenshots/chrome-detail-6.jpeg" width="400"><br><sub>Detail: gambar dan info berdampingan</sub></td>
    <td><img src="screenshots/chrome-detail-7.jpeg" width="400"><br><sub>Detail: gambar dan info berdampingan</sub></td>
    <td><img src="screenshots/chrome-detail-8.jpeg" width="400"><br><sub>Detail: gambar dan info berdampingan</sub></td>

  </tr>
</table>

### Perubahan susunan menurut lebar layar (Chrome)
<table>
  <tr>
    <td valign="top"><img src="screenshots/chrome-360.jpeg" width="160"><br><sub>360 dp: 2 kolom, NavigationBar</sub></td>
    <td valign="top"><img src="screenshots/chrome-700.jpeg" width="260"><br><sub>700 dp: 3 kolom, NavigationBar</sub></td>
    <td valign="top"><img src="screenshots/chrome-1024.jpeg" width="330"><br><sub>1024 dp: NavigationRail, 4 kolom</sub></td>
    <td valign="top"><img src="screenshots/chrome-1280.jpeg" width="400"><br><sub>1280 dp: NavigationRail, 4 kolom</sub></td>
  </tr>
</table>

## Penjelasan Keputusan Responsif
Saya memakai dua alat ukur yang berbeda sesuai kebutuhannya. `MediaQuery.sizeOf` saya pakai di `KerangkaNavigasi` (`lib/main.dart`) untuk memilih `NavigationBar` pada lebar di bawah 840 dp dan `NavigationRail` pada 840 dp ke atas, karena pilihan itu menyangkut seluruh layar dan mengikuti batas expanded Material 3. `LayoutBuilder` saya pakai di `HalamanDaftar` untuk menentukan jumlah kolom grid: 2 kolom di bawah 600 dp, 3 kolom di bawah 900 dp, 4 kolom di bawah 1200 dp, dan 5 kolom di atasnya. Di sini `LayoutBuilder` lebih tepat karena yang penting adalah lebar ruang milik grid, yang lebih sempit dari layar ketika `NavigationRail` tampil. `HalamanDetail` juga memakai `LayoutBuilder` dengan batas 700 dp: di bawahnya gambar dan info tersusun vertikal dalam `ListView`, di atasnya berdampingan dalam `Row`. Gambar di halaman detail memakai `Stack` untuk menumpuk label kategori dan lencana tiket. Agar tidak overflow dari 360 sampai 1280 dp, nama dan kota di kartu dibatasi satu baris dengan `ellipsis`, tinggi kartu grid ditetapkan dengan `mainAxisExtent`, dan halaman detail dapat digulir.

## Pernyataan Penggunaan AI
Saya menggunakan Claude (Anthropic) selama mengerjakan tugas ini.

**Dibantu AI:**
- Penjelasan materi Pertemuan 6 (modul dan slide).
- Kode seluruh berkas di folder `lib` dan `test`.
- Langkah Git dan kerangka README.
- Draf bagian Penjelasan (saya baca, pahami, dan sesuaikan).

**Saya kerjakan sendiri:**
- Membuat proyek dan repository GitHub, serta melakukan commit dan push.
- Menjalankan aplikasi di Chrome dan di HP Infinix, menguji beberapa ukuran layar, dan mengambil tangkapan layar.
- Menjalankan `flutter test`, `flutter analyze`, dan `dart format`.
- Draf bagian Penjelasan saya baca, pahami, dan sesuaikan.