import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'insights_screen.dart';
import 'profile_screen.dart';
import 'share_screen.dart';

// list of maps
// each map contains a string key and differing value types so dynamic
final List<Map<String, dynamic>> pageDetails = [
  {
    'pageName': HomeScreen(
      bgColor: Colors.blue.shade200,
    ),
    'title': 'Home',
    'navigationBarColor': Colors.blue.shade200,
    'bottom_color': Colors.blue.shade600
  },
  {
    'pageName': InsightsScreen(
      bgColor: Colors.green.shade200,
    ),
    'title': 'Manufacturers',
    'navigationBarColor': Colors.green.shade200,
    'bottom_color': Colors.green.shade600
  },
  {
    'pageName': ProfileScreen(
      bgColor: const Color.fromARGB(255, 255, 244, 238),
    ),
    'title': 'Profile',
    'navigationBarColor': const Color.fromARGB(255, 255, 244, 238),
    'bottom_color': Colors.amber.shade600
  },
  {
    'pageName': ShareScreen(
      bgColor: const Color.fromARGB(255, 167, 143, 244),
    ),
    'title': 'Share',
    'navigationBarColor': const Color.fromARGB(255, 167, 143, 244),
    'bottom_color': const Color.fromARGB(255, 74, 25, 238),
  },
];