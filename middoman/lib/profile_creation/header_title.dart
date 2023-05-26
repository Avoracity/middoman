import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Header Title Widget
class HeaderTitle extends StatelessWidget {
  final String title;

  const HeaderTitle({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.leagueSpartan(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.bold,
        fontSize: 40.0,
        color: const Color.fromARGB(255, 58, 59, 123),
      ),
    );
  }
}