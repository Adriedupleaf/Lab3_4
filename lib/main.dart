import 'package:flutter/material.dart';
import 'package:lab_3/presentation/HomeScreen.dart';
import 'package:get/get.dart';


void main() {
  runApp(const WineApp());
}

class WineApp extends StatelessWidget {
  const WineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Wine App',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}