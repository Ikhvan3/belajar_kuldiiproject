import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(ImageApp());
}

class ImageApp extends StatelessWidget {
  const ImageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("image"),
        ),
        body: Center(
          child: Container(
            width: 350,
            height: 500,
            color: Colors.amber,
            child: Image.asset(
              "images/bosscha.jpg",
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
