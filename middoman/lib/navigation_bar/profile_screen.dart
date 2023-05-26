import 'package:flutter/material.dart';
import 'package:middoman/profile_view/profile_view.dart';

class ProfileScreen extends StatelessWidget {
  Color bgColor;
  ProfileScreen({
    Key? key,
    required this.bgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      child: const ProfileView(),
    );
  }
}
