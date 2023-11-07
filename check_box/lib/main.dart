import 'package:check_box/main_page.dart';
import 'package:check_box/single_main_paig.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainPage(isActive: false, text: 'hell'),
    );
  }
}
