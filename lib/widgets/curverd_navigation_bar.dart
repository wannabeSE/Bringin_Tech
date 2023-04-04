import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class CurvedNavBar extends StatefulWidget {
  const CurvedNavBar({super.key});

  @override
  State<CurvedNavBar> createState() => _CurvedNavBarState();
}

class _CurvedNavBarState extends State<CurvedNavBar> {
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: Colors.white,
      color: const Color.fromARGB(175, 0, 0, 0),
      buttonBackgroundColor: const Color.fromARGB(230, 62, 90, 124),
      items:  const [
        Icon(Icons.person_2_outlined,color: Colors.white),
        Icon(Icons.home,color: Colors.white),
        Icon(Icons.message_rounded,color: Colors.white),
      ]
    );
  }
}