import 'package:material_ui/material_ui.dart';

/// Satu destinasi wisata.
class Destinasi {
  const Destinasi({
    required this.id,
    required this.nama,
    required this.kota,
    required this.kategori,
    required this.deskripsi,
    required this.tiket,
    required this.ikon,
    required this.warna,
  });

  final int id;
  final String nama;
  final String kota;
  final String kategori;
  final String deskripsi;

  /// Harga tiket dalam rupiah; 0 berarti gratis.
  final int tiket;
  final IconData ikon;
  final Color warna;

  bool get gratis => tiket == 0;

  String get hargaTeks => gratis ? 'Gratis' : tiket.rupiah;
}

/// Data contoh. Harga tiket hanya untuk latihan.
const daftarDestinasi = <Destinasi>[
  Destinasi(
    id: 1,
    nama: 'Danau Toba',
    kota: 'Kab. Samosir',
    kategori: 'Alam',
    deskripsi:
        'Danau vulkanik terbesar di dunia dengan Pulau Samosir di tengahnya. '
        'Cocok untuk menikmati pemandangan, budaya Batak, dan kuliner lokal.',
    tiket: 0,
    ikon: Icons.water,
    warna: Color(0xFF0277BD),
  ),
  Destinasi(
    id: 2,
    nama: 'Bukit Lawang',
    kota: 'Kab. Langkat',
    kategori: 'Ekowisata',
    deskripsi:
        'Pintu masuk pengamatan orangutan sumatera di tepi Taman Nasional '
        'Gunung Leuser, lengkap dengan sungai untuk tubing.',
    tiket: 50000,
    ikon: Icons.forest,
    warna: Color(0xFF2E7D32),
  ),
  Destinasi(
    id: 3,
    nama: 'Istana Maimun',
    kota: 'Kota Medan',
    kategori: 'Sejarah',
    deskripsi:
        'Istana Kesultanan Deli bergaya Melayu, Timur Tengah, dan Eropa yang '
        'dibangun pada akhir abad ke-19.',
    tiket: 10000,
    ikon: Icons.account_balance,
    warna: Color(0xFFF9A825),
  ),
  Destinasi(
    id: 4,
    nama: 'Berastagi',
    kota: 'Kab. Karo',
    kategori: 'Alam',
    deskripsi:
        'Kota dataran tinggi berhawa sejuk, terkenal dengan buah markisa, '
        'jeruk, dan pemandangan Gunung Sibayak serta Sinabung.',
    tiket: 0,
    ikon: Icons.terrain,
    warna: Color(0xFF558B2F),
  ),
  Destinasi(
    id: 5,
    nama: 'Air Terjun Sipiso-piso',
    kota: 'Kab. Karo',
    kategori: 'Alam',
    deskripsi:
        'Air terjun tinggi yang jatuh ke arah Danau Toba, dengan titik '
        'pandang di bibir tebing.',
    tiket: 10000,
    ikon: Icons.waterfall_chart,
    warna: Color(0xFF00838F),
  ),
  Destinasi(
    id: 6,
    nama: 'Masjid Raya Al Mashun',
    kota: 'Kota Medan',
    kategori: 'Religi',
    deskripsi:
        'Masjid bersejarah peninggalan Kesultanan Deli dengan arsitektur '
        'perpaduan Timur Tengah, India, dan Eropa.',
    tiket: 0,
    ikon: Icons.mosque,
    warna: Color(0xFF6A1B9A),
  ),
  Destinasi(
    id: 7,
    nama: 'Tjong A Fie Mansion',
    kota: 'Kota Medan',
    kategori: 'Sejarah',
    deskripsi:
        'Rumah saudagar Tionghoa Tjong A Fie yang memadukan arsitektur '
        'Tionghoa, Melayu, dan Eropa, kini terbuka untuk umum.',
    tiket: 35000,
    ikon: Icons.museum,
    warna: Color(0xFFC62828),
  ),
  Destinasi(
    id: 8,
    nama: 'Pantai Cermin',
    kota: 'Kab. Serdang Bedagai',
    kategori: 'Pantai',
    deskripsi:
        'Pantai berpasir landai di pesisir timur Sumatera Utara, cocok '
        'untuk bersantai bersama keluarga.',
    tiket: 15000,
    ikon: Icons.beach_access,
    warna: Color(0xFFEF6C00),
  ),
];

/// Mencari destinasi berdasarkan id. Mengembalikan null bila tidak ada.
Destinasi? cariDestinasi(int id) {
  for (final d in daftarDestinasi) {
    if (d.id == id) return d;
  }
  return null;
}

extension Rupiah on int {
  /// 50000 menjadi "Rp50.000".
  String get rupiah {
    final pola = RegExp(r'\B(?=(\d{3})+(?!\d))');
    return 'Rp${toString().replaceAllMapped(pola, (m) => '.')}';
  }
}