import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(FitedboxApp());
}

class FitedboxApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeFitedbox(),
    );
  }
}

class HomeFitedbox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Template"),
      ),
      body: Center(
          child: Container(
        color: Colors.blue,
        width: 300,
        height: 114,
        child: FittedBox(
          child: Text(
            "Haloooooooooooo000000000",
            style: TextStyle(
              fontSize: 35,
              color: Colors.white,
            ),
          ),
        ),
      )),
    );
  }
}
