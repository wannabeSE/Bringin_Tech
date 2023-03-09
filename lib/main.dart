import 'package:bringin_texh/screens/dummy_screen.dart';
import 'package:bringin_texh/screens/set_profile.dart';
import 'package:flutter/material.dart';
// import 'package:bringin_texh/screens/welcome.dart';
void main() {
  runApp(const MyApp());
}
 class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:  false,
      home:const CreateProfile(),
      routes: {
        '/dummy_screen':(context) => const DummyScreen(),
      },
    );
  }
}
