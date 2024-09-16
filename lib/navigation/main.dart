import 'package:belajar_kuldii/navigation/page1.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(AppNavigation());
}

class AppNavigation extends StatelessWidget {
  const AppNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Apppagesatu(),
    );
  }
}
