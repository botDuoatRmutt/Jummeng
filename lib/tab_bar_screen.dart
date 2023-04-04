import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import './tabs/tab_map.dart';


class TabBarScreen extends StatefulWidget {
  const TabBarScreen({super.key});

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  int _activePageIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageDetails[_activePageIndex]['title']),
      ),
      body: PageView(
        controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _activePageIndex = index;
            });
          },
          children: [
            pageDetails[0]['pageName'],
            pageDetails[1]['pageName'],
            pageDetails[2]['pageName'],
            // pageDetails[3]['pageName'],
          ]),
      bottomNavigationBar: CurvedNavigationBar(
        index: _activePageIndex,
        onTap: (index) {
          _pageController.animateToPage(
            index, 
            duration: const Duration(microseconds: 300), 
            curve: Curves.ease,
          );
        },
        items : const [
            Icon(Icons.home, size: 30, color: Colors.orangeAccent,),                             // index 0
            Icon(Icons.person_outline, size: 30),                   // index 1
            // Icon(Icons.favorite_outline, size: 30),                   // index 2
            Icon(Icons.search_outlined, size: 30),                   // index 3
          ],
      ),
    );
  }
}