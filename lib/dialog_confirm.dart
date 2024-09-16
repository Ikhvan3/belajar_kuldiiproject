import 'package:belajar_kuldii/mydialoghome.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(Myappdialog());
}

class Myappdialog extends StatelessWidget {
  const Myappdialog({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Mydialoghome(),
    );
  }
}
