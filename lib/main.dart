// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_main/View/Interface/interface.dart';

const deepTeal = Color(0xFF0D4D66);
const mistyAqua = Color(0xFF9FBFC5);
const darkBackground = Color(0xFF0A3A4D);
const lightText = Color(0xFFE0F2F6);
const offWhite = Color(0xFFF5F7F9);

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio Website',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: deepTeal,
        scaffoldBackgroundColor: offWhite,
        colorScheme: ColorScheme.fromSeed(
          seedColor: deepTeal,
          primary: deepTeal,
          secondary: mistyAqua,
          tertiary: lightText,
          background: offWhite,
          surface: offWhite,
          brightness: Brightness.light,
        ),
        textTheme: GoogleFonts.outfitTextTheme(),
        useMaterial3: true,
      ),
      home: const Interface(),
    );
  }
}
