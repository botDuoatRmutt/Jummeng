import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'profile_screen.dart';
import 'search_screen.dart';

final List<Map<String, dynamic>> pageDetails = [
  {
    'pageName': HomeScreen(),
    'title': 'จุ๊มเหม่งพาทัวร์',
    'navigationBarColor': Colors.blue.shade200,
    'bottom_color': Colors.blue.shade600
  },
  {
    'pageName': ProfileScreen(title: 'โปรไฟล์'),
    'title': 'Profile',
    'navigationBarColor': Colors.amber.shade200,
    'bottom_color': Colors.amber.shade600
  },
  {
    'pageName': SearchScreen(),
    'title': 'Search',
    'navigationBarColor': const Color.fromARGB(255, 167, 143, 244),
    'bottom_color': const Color.fromARGB(255, 74, 25, 238),
  },
];
