import 'package:material_ui/material_ui.dart';

import 'data.dart';

/// Latar gradien berwarna destinasi dengan ikon di tengah.
class LatarDestinasi extends StatelessWidget {
  const LatarDestinasi({
    super.key,
    required this.destinasi,
    this.ukuranIkon = 56,
  });

  final Destinasi destinasi;
  final double ukuranIkon;

  @override
  Widget build(BuildContext context) {
    final warna = destinasi.warna;

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            warna.withValues(alpha: 0.35),
            warna.withValues(alpha: 0.10),
          ],
        ),
      ),
      child: Center(
        child: Icon(destinasi.ikon, size: ukuranIkon, color: warna),
      ),
    );
  }
}

/// Label kategori kecil yang ditumpuk di atas gambar (dipakai di dalam Stack).
class LabelKategori extends StatelessWidget {
  const LabelKategori({super.key, required this.teks});

  final String teks;

  @override
  Widget build(BuildContext context) {
    final skema = Theme.of(context).colorScheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: skema.surface.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: Text(teks, style: Theme.of(context).textTheme.labelSmall),
      ),
    );
  }
}