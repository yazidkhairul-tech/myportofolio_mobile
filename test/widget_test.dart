import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:myportofolio_mobile/main.dart';

void main() {
  testWidgets('MyPortfolio home page renders InfoCards and ItemCards',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Memastikan judul dan pesan sambutan tampil.
    expect(find.text('MyPortfolio'), findsOneWidget);
    expect(find.text('Selamat datang di MyPortfolio Mobile!'), findsOneWidget);

    // Memastikan 3 kartu informasi identitas tampil.
    expect(find.text('NPM'), findsOneWidget);
    expect(find.text('Name'), findsOneWidget);
    expect(find.text('Class'), findsOneWidget);

    // Memastikan tombol aksi beserta ikonnya tampil dan memicu SnackBar saat ditekan.
    expect(find.byIcon(Icons.folder_rounded), findsOneWidget);
    expect(find.text('Lihat Proyek'), findsOneWidget);
    await tester.tap(find.text('Lihat Proyek'));
    await tester.pump();

    expect(
      find.text('Kamu telah menekan tombol Lihat Proyek!'),
      findsOneWidget,
    );
  });
}
