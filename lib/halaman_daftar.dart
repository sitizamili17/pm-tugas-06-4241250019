import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import 'data.dart';
import 'widget_umum.dart';

class HalamanDaftar extends StatelessWidget {
  const HalamanDaftar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wisata Sumatera Utara')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // LayoutBuilder dipilih karena yang penting adalah lebar ruang
          // milik grid, bukan lebar seluruh layar (NavigationRail memakan
          // sebagian lebar di layar lebar).
          final kolom = switch (constraints.maxWidth) {
            < 600 => 2,
            < 900 => 3,
            < 1200 => 4,
            _ => 5,
          };

          return GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: kolom,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              mainAxisExtent:
                  240, // tinggi tetap supaya isi kartu tidak overflow
            ),
            itemCount: daftarDestinasi.length,
            itemBuilder: (context, i) =>
                KartuDestinasi(destinasi: daftarDestinasi[i]),
          );
        },
      ),
    );
  }
}

/// Satu kartu destinasi pada grid.
class KartuDestinasi extends StatelessWidget {
  const KartuDestinasi({super.key, required this.destinasi});

  final Destinasi destinasi;

  @override
  Widget build(BuildContext context) {
    final d = destinasi;
    final skema = Theme.of(context).colorScheme;
    final teks = Theme.of(context).textTheme;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => context.go('/destinasi/${d.id}'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              // Stack: label kategori ditumpuk di atas latar gambar
              child: Stack(
                children: [
                  Positioned.fill(child: LatarDestinasi(destinasi: d)),
                  Positioned(
                    top: 8,
                    left: 8,
                    child: LabelKategori(teks: d.kategori),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    d.nama,
                    style: teks.titleSmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    d.kota,
                    style: teks.bodySmall?.copyWith(
                      color: skema.onSurfaceVariant,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    d.hargaTeks,
                    style: teks.labelLarge?.copyWith(color: skema.primary),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
