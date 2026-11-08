import 'package:material_ui/material_ui.dart';

class HalamanTentang extends StatelessWidget {
  const HalamanTentang({super.key});

  @override
  Widget build(BuildContext context) {
    final skema = Theme.of(context).colorScheme;
    final teks = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Tentang Aplikasi')),
      body: Center(
        child: ConstrainedBox(
          // Dibatasi supaya tetap rapi di layar lebar
          constraints: const BoxConstraints(maxWidth: 720),
          child: ListView(
            children: [
              SizedBox(
                height: 180,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: ColoredBox(color: skema.primaryContainer),
                    ),
                    Positioned(
                      right: -20,
                      bottom: -24,
                      child: Icon(
                        Icons.landscape,
                        size: 160,
                        color: skema.primary.withValues(alpha: 0.2),
                      ),
                    ),
                    Positioned(
                      left: 20,
                      bottom: 20,
                      child: Text(
                        'Wisata Sumatera Utara',
                        style: teks.headlineSmall,
                      ),
                    ),
                  ],
                ),
              ),
              const ListTile(
                leading: Icon(Icons.person_outline),
                title: Text('Siti Haliza Zamili'),
                subtitle: Text('NIM 4241250019 · PSIK 24D'),
              ),
              const ListTile(
                leading: Icon(Icons.school_outlined),
                title: Text('Pemrograman Mobile'),
                subtitle: Text('Tugas Rutin 6'),
              ),
              const ListTile(
                leading: Icon(Icons.info_outline),
                title: Text('Data destinasi'),
                subtitle: Text('Sumatera Utara'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
