import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(TemplateKuldi());
}

class TemplateKuldi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeTemplate(),
    );
  }
}

class HomeTemplate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Template"),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}
