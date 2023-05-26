import 'package:flutter/material.dart';
import 'package:middoman/get_started_container/get_started_page.dart';

class HomeScreen extends StatefulWidget {
  final Color bgColor;
  const HomeScreen({
    Key? key,
    required this.bgColor,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.bgColor,
      child: const GetStartedPage(),
    );
  }
}
