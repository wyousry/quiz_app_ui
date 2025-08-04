import 'package:flutter/material.dart';
import 'package:quiz_app/screens/welcome_screen.dart';
import 'package:get/get.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: WelcomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}