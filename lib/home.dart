import 'package:flutter/material.dart';
import 'screens/generateQRpage.dart';
import 'screens/scanQRpage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  bool isDark = false;

  List<Widget> Pages = [const GenerateQRpage(), const ScanQRpage()];

  // Define custom light & dark themes with consistent colors
  final ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF5C6BC0), // Indigo
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: const Color(0xFFF5F5F5),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF5C6BC0),
      foregroundColor: Colors.white,
      elevation: 2,
    ),
    cardColor: Colors.white,
    useMaterial3: true,
  );

  final ThemeData softDarkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF7986CB), // Light Indigo
      brightness: Brightness.dark,
    ),
    scaffoldBackgroundColor: const Color(0xFF17313E),
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xFF1F3C50),
      foregroundColor: Colors.cyan[300],
      elevation: 2,
    ),
    cardColor: const Color(0xFF2C2C2C),
    useMaterial3: true,
  );

  @override
  Widget build(BuildContext context) {
    final currentTheme = isDark ? softDarkTheme : lightTheme;

    return Theme(
      data: currentTheme,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'QR Code App',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
              onPressed: () {
                setState(() {
                  isDark = !isDark;
                });
              },
              tooltip: isDark ? 'Light Mode' : 'Dark Mode',
            )
          ],
        ),
        body: Pages[currentIndex],
        bottomNavigationBar: NavigationBar(
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.qr_code),
              label: 'Generate',
            ),
            NavigationDestination(
              icon: Icon(Icons.qr_code_scanner),
              label: 'Scan',
            ),
          ],
          onDestinationSelected: (int value) {
            setState(() {
              currentIndex = value;
            });
          },
          selectedIndex: currentIndex,
        ),
      ),
    );
  }
}