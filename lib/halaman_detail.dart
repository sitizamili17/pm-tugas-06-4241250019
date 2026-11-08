import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import 'data.dart';
import 'widget_umum.dart';

class HalamanDetail extends StatelessWidget {
  const HalamanDetail({super.key, required this.destinasi});

  /// null bila ID di URL tidak dikenal.
  final Destinasi? destinasi;

  @override
  Widget build(BuildContext context) {
    final d = destinasi;
    if (d == null) return const HalamanTidakDitemukan();

    final skema = Theme.of(context).colorScheme;
    final teks = Theme.of(context).textTheme;

    // Stack: label kategori dan lencana tiket ditumpuk di atas gambar.
    final gambar = AspectRatio(
      aspectRatio: 4 / 3,
      child: Stack(
        children: [
          Positioned.fill(child: LatarDestinasi(destinasi: d, ukuranIkon: 120)),
          Positioned(top: 16, left: 16, child: LabelKategori(teks: d.kategori)),
          Positioned(
            right: 16,
            bottom: 16,
            child: Chip(
              avatar: const Icon(Icons.confirmation_number_outlined, size: 18),
              label: Text(d.hargaTeks),
            ),
          ),
        ],
      ),
    );

    final info = Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(d.nama, style: teks.headlineSmall),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.place_outlined, size: 18, color: skema.primary),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  d.kota,
                  style: teks.bodyLarge,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Tiket masuk',
            style: teks.labelLarge?.copyWith(color: skema.onSurfaceVariant),
          ),
          Text(
            d.hargaTeks,
            style: teks.titleLarge?.copyWith(color: skema.primary),
          ),
          const SizedBox(height: 16),
          Text(d.deskripsi, style: teks.bodyLarge?.copyWith(height: 1.5)),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text(d.nama)),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 700) {
            // Lebar: gambar dan info berdampingan
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: gambar),
                Expanded(child: SingleChildScrollView(child: info)),
              ],
            );
          }
          // Sempit: gambar di atas, info di bawah
          return ListView(children: [gambar, info]);
        },
      ),
    );
  }
}

/// Halaman untuk ID destinasi atau URL yang tidak dikenal.
class HalamanTidakDitemukan extends StatelessWidget {
  const HalamanTidakDitemukan({super.key});

  @override
  Widget build(BuildContext context) {
    final teks = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Destinasi tidak ditemukan')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.search_off, size: 72),
              const SizedBox(height: 16),
              Text(
                'Halaman yang kamu cari tidak ada.',
                style: teks.titleMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: () => context.go('/'),
                child: const Text('Kembali ke daftar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
