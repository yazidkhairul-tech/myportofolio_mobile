import 'package:flutter/material.dart';

/// Halaman utama aplikasi portofolio pribadi (StatelessWidget).
///
/// Menampilkan banner profil bertema Blaugrana (FC Barcelona),
/// tiga kartu identitas ([InfoCard]), serta kisi menu aksi ([ItemCard]).
class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  // TODO: Ganti dengan NPM, Nama Lengkap, dan Kelas PBP asli kamu.
  final String npm = "2406xxxxxx";
  final String nama = "Yazid Khairul";
  final String kelas = "PBP A";

  /// Daftar tombol aksi portofolio dengan ikon dan warna latar yang unik serta kontras.
  final List<ItemHomepage> items = [
    ItemHomepage("Lihat Proyek", Icons.folder_rounded, const Color(0xFF004D98)),
    ItemHomepage(
      "Tambah Proyek",
      Icons.add_circle_rounded,
      const Color(0xFFA50044),
    ),
    ItemHomepage(
      "Lihat Education",
      Icons.school_rounded,
      const Color(0xFF0D7A5F),
    ),
    ItemHomepage("Lihat Skills", Icons.bolt_rounded, const Color(0xFFD97706)),
    ItemHomepage(
      "Lihat Experience",
      Icons.work_rounded,
      const Color(0xFF4F46E5),
    ),
    ItemHomepage("Logout", Icons.logout_rounded, const Color(0xFFDC2626)),
  ];

  /// Mengambil maksimal dua huruf inisial dari [fullName] untuk avatar profil.
  String _getInitials(String fullName) {
    final parts = fullName.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty || parts.first.isEmpty) return 'MP';
    if (parts.length == 1) return parts.first[0].toUpperCase();
    return '${parts.first[0]}${parts.last[0]}'.toUpperCase();
  }

  /// Menampilkan dialog informasi singkat aplikasi dari tombol AppBar.
  void _showAboutDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Row(
            children: [
              Icon(Icons.shield_rounded, color: Color(0xFF004D98)),
              SizedBox(width: 8),
              Text(
                'MyPortfolio Mobile',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          content: Text(
            'Aplikasi mobile portofolio pribadi milik $nama ($npm - $kelas).\n\n'
            'Didesain dengan palet warna Blaugrana (biru & merah marun) '
            'sebagai bagian dari Individual Assignment 7 PBP.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text('Tutup'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.code_rounded, color: Color(0xFFEDBB00)),
            SizedBox(width: 8),
            Text(
              'MyPortfolio',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.4,
              ),
            ),
          ],
        ),
        backgroundColor: colorScheme.primary,
        actions: [
          IconButton(
            tooltip: 'Tentang Aplikasi',
            icon: const Icon(Icons.info_outline_rounded, color: Colors.white),
            onPressed: () => _showAboutDialog(context),
          ),
        ],
      ),
      // SingleChildScrollView mencegah overflow pada layar berukuran kecil.
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Banner hero profil bertema gradien Blaugrana (FC Barcelona).
            Container(
              padding: const EdgeInsets.all(18.0),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF004D98), Color(0xFFA50044)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(18),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x29004D98),
                    blurRadius: 12,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: const Color(0xFFEDBB00),
                    child: Text(
                      _getInitials(nama),
                      style: const TextStyle(
                        color: Color(0xFF0A1E3F),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          nama,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'Mobile Portfolio • Blaugrana Edition',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16.0),

            // Baris horizontal untuk menampilkan 3 InfoCard secara sejajar.
            Row(
              children: [
                Expanded(
                  child: InfoCard(
                    title: 'NPM',
                    content: npm,
                    accentColor: const Color(0xFF004D98),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: InfoCard(
                    title: 'Name',
                    content: nama,
                    accentColor: const Color(0xFFA50044),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: InfoCard(
                    title: 'Class',
                    content: kelas,
                    accentColor: const Color(0xFFEDBB00),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20.0),

            // Bagian tengah: pesan sambutan dan kisi tombol menu portofolio.
            const Center(
              child: Column(
                children: [
                  Text(
                    'Selamat datang di MyPortfolio Mobile!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Color(0xFF0A1E3F),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Pilih menu di bawah untuk menjelajahi portofolio',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13.0,
                      color: Color(0xFF5A677D),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12.0),

            // GridView menampilkan kartu tombol dalam tata letak kisi 3 kolom.
            GridView.count(
              primary: false,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              crossAxisCount: 3,
              // shrinkWrap agar ukuran kisi menyesuaikan tinggi konten anak.
              shrinkWrap: true,
              children: items.map((ItemHomepage item) {
                return ItemCard(item);
              }).toList(),
            ),

            const SizedBox(height: 16.0),

            // Kartu ringkasan teknologi sebagai elemen UI tambahan yang relevan.
            Container(
              padding: const EdgeInsets.all(14.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: const Color(0xFFE2E8F0)),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tech Stack & Status',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Color(0xFF0A1E3F),
                    ),
                  ),
                  SizedBox(height: 10),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _TechBadge(
                        label: 'Flutter',
                        color: Color(0xFF004D98),
                      ),
                      _TechBadge(
                        label: 'Dart',
                        color: Color(0xFFA50044),
                      ),
                      _TechBadge(
                        label: 'Material 3',
                        color: Color(0xFF0D7A5F),
                      ),
                      _TechBadge(
                        label: 'PBP Gasal 2026/2027',
                        color: Color(0xFF4F46E5),
                      ),
                    ],
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

/// Kartu informasi identitas pemilik portofolio ([title] dan [content]).
class InfoCard extends StatelessWidget {
  final String title;
  final String content;
  final Color accentColor;

  const InfoCard({
    super.key,
    required this.title,
    required this.content,
    this.accentColor = const Color(0xFF004D98),
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Garis aksen atas berwarna Blaugrana untuk membedakan tiap kartu.
          Container(
            height: 4,
            width: double.infinity,
            color: accentColor,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 8.0),
            child: Column(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: accentColor == const Color(0xFFEDBB00)
                        ? const Color(0xFF0A1E3F)
                        : accentColor,
                  ),
                ),
                const SizedBox(height: 6.0),
                Text(
                  content,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF1E293B),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Model data untuk setiap tombol menu di halaman utama.
class ItemHomepage {
  final String name;
  final IconData icon;
  final Color color;

  ItemHomepage(this.name, this.icon, this.color);
}

/// Kartu tombol aksi interaktif yang menampilkan [SnackBar] saat ditekan.
class ItemCard extends StatelessWidget {
  final ItemHomepage item;

  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      elevation: 3.0,
      shadowColor: item.color.withValues(alpha: 0.4),
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        // Aksi ketika kartu ditekan oleh pengguna.
        onTap: () {
          // Sembunyikan SnackBar sebelumnya agar notifikasi tidak menumpuk.
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                behavior: SnackBarBehavior.floating,
                backgroundColor: item.color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                content: Text(
                  "Kamu telah menekan tombol ${item.name}!",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            );
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const SizedBox(height: 6),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Badge kecil untuk menampilkan tag teknologi pada bagian ringkasan.
class _TechBadge extends StatelessWidget {
  final String label;
  final Color color;

  const _TechBadge({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
