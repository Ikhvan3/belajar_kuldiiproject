import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(controlApp());
}

class controlApp extends StatefulWidget {
  @override
  State<controlApp> createState() => _controlAppState();
}

class _controlAppState extends State<controlApp> {
  final TextEditingController myController = TextEditingController();

  String hasil = "EDIT SUCCESS";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Text Field"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextField(
                  controller: myController,
                  onChanged: (value) {
                    print("ONCHANGE");
                    setState(() {
                      hasil = value;
                    });
                  },
                  onSubmitted: (value) {
                    print(value);
                  },
                  onEditingComplete: () {
                    print("EDIT SUCCESS");
                    print(myController.text);
                  },
                ),
                Text(hasil),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
