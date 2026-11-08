import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:pm_tugas_06_4241250019/main.dart';

void main() {
  testWidgets('Membuka detail destinasi dari daftar', (tester) async {
    await tester.pumpWidget(const WisataApp());
    await tester.pumpAndSettle();

    expect(find.text('Danau Toba'), findsOneWidget);

    await tester.tap(find.text('Danau Toba'));
    await tester.pumpAndSettle();

    expect(find.text('Tiket masuk'), findsOneWidget);
    expect(find.byType(BackButton), findsOneWidget);
  });

  testWidgets('Tidak ada overflow dari 360 hingga 1280 dp', (tester) async {
    addTearDown(tester.view.reset);
    tester.view.devicePixelRatio = 1.0;

    for (final lebar in [360.0, 600.0, 840.0, 1280.0]) {
      tester.view.physicalSize = Size(lebar, 800);
      await tester.pumpWidget(const WisataApp());
      await tester.pumpAndSettle();
      expect(
        tester.takeException(),
        isNull,
        reason: 'Daftar overflow pada lebar $lebar',
      );

      await tester.tap(find.text('Danau Toba'));
      await tester.pumpAndSettle();
      expect(
        tester.takeException(),
        isNull,
        reason: 'Detail overflow pada lebar $lebar',
      );

      await tester.pageBack();
      await tester.pumpAndSettle();
    }
  });
}
