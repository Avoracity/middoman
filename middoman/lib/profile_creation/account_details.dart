import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Input Form Widget
class AccountDetail extends StatelessWidget {
  final String textLabel;
  final TextEditingController userController;
  final Widget? suffixIcon;
  final bool? enabled;

  const AccountDetail({
    required this.textLabel,
    required this.userController,
    required this.suffixIcon,
    this.enabled,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: userController,
      enabled: enabled,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        labelText: textLabel,
        labelStyle: GoogleFonts.leagueSpartan(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.normal,
          fontSize: 24.0,
          color: const Color.fromARGB(255, 58, 59, 123),
        ),
      ),
      style: GoogleFonts.leagueSpartan(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        fontSize: 20.0,
      ),
    );
  }
}