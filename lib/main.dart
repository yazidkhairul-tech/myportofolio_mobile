import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/menu.dart';

/// Titik masuk utama aplikasi mobile MyPortfolio.
void main() {
  runApp(const MyApp());
}

/// Root widget aplikasi yang mengonfigurasi tema Blaugrana (FC Barcelona)
/// dan menentukan halaman utama [MyHomePage].
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /// Palet warna utama terinspirasi FC Barcelona (Blaugrana).
  static const Color barcaBlue = Color(0xFF004D98);
  static const Color barcaGarnet = Color(0xFFA50044);
  static const Color barcaGold = Color(0xFFEDBB00);
  static const Color barcaSurface = Color(0xFFF5F7FB);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyPortfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: barcaSurface,
        colorScheme: ColorScheme.fromSeed(
          seedColor: barcaBlue,
          primary: barcaBlue,
          secondary: barcaGarnet,
          tertiary: barcaGold,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: barcaBlue,
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: false,
        ),
        cardTheme: CardThemeData(
          color: Colors.white,
          surfaceTintColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}
