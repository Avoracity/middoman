import 'package:flutter/material.dart';
import 'package:middoman/manufacturer_display/manufacturer_screen.dart';

class InsightsScreen extends StatelessWidget {
  Color bgColor;
  InsightsScreen({
    Key? key,
    required this.bgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      child: const ManufacturerScreen(),
    );
  }
}
