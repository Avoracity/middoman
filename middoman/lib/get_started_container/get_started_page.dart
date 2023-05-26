import 'package:flutter/material.dart';

import 'started_carousel.dart';
import 'started_button.dart';
import 'started_list_container.dart';
import 'started_search.dart';

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({super.key});
  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  // variables

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
                    StartedList(),
                    StartedButton(),
                    StartedCarousel(),
                  ])),
        )));
  }
}
