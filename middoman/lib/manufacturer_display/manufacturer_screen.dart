import 'package:flutter/material.dart';
import 'manu_list_container.dart';


void main() => runApp(const ManufacturerScreen());

class ManufacturerScreen extends StatefulWidget {
  const ManufacturerScreen({super.key});

  @override
  State<ManufacturerScreen> createState() => _ManufacturerScreenState();
}

class _ManufacturerScreenState extends State<ManufacturerScreen> {

  @override
  void initState() {
    super.initState();
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFFF4EE),
        body: SingleChildScrollView(
            child: SingleChildScrollView(
          child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    ManuList(),
                  ])),
        )));
  }
}