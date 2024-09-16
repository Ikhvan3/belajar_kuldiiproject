import 'package:flutter/material.dart';

class PhotoPage extends StatelessWidget {
  static const nameRoute = '/photo';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Photo Page"),
      ),
      body: Center(
        child: Text(
          "Photo PAGE",
          style: TextStyle(fontSize: 50),
        ),
      ),
    );
  }
}
