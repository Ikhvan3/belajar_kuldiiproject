import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(belajarApp());
}

class belajarApp extends StatelessWidget {
  const belajarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          leading: Container(
            color: Colors.amber,
          ),
          leadingWidth: 100,
          title: Container(
            // width: 35,
            height: 35,
            color: Colors.red,
          ),
          titleSpacing: 5,
          centerTitle: false,
          actions: [
            Container(
              width: 35,
              //height: 35,
              color: Color.fromARGB(255, 45, 157, 30),
            ),
            Container(
              width: 35,
              //height: 35,
              color: Colors.black,
            ),
            Container(
              width: 35,
              //height: 35,
              color: Color.fromARGB(255, 255, 14, 191),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(200),
            child: Container(
              width: 35,
              height: 35,
              color: Color.fromARGB(255, 255, 14, 191),
            ),
          ),
          flexibleSpace: Container(
            height: 200,
            color: Color.fromARGB(255, 255, 14, 191),
          ),
        ),
      ),
    );
  }
}
