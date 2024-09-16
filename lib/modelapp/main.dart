import 'package:belajar_kuldii/modelapp/pages/modelapp.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(ModelApp());
}

class ModelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePageModelApp(),
    );
  }
}
