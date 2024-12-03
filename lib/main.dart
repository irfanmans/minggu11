import 'package:flutter/material.dart';
// import 'package:minggu11/screens/accessibility.dart';
import 'package:minggu11/screens/localization.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Localization(),
    );
  }
}
