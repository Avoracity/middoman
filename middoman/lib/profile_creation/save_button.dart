import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EndButton extends StatelessWidget {
  final void Function()? onPressed;
  final Color userColor;
  final Color? textColor;
  final String buttonName;

  const EndButton({
    required this.onPressed,
    required this.buttonName,
    required this.userColor,
    required this.textColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 5,
        shape: const StadiumBorder(),
        backgroundColor: userColor,
      ),
      child: Text(
        buttonName,
        style: GoogleFonts.leagueSpartan(
          fontSize: 20.0,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
