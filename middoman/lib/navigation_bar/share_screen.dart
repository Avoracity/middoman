import 'package:flutter/material.dart';

class ShareScreen extends StatelessWidget {
  Color bgColor;
  ShareScreen({
    Key? key,
    required this.bgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
    );
  }
}
