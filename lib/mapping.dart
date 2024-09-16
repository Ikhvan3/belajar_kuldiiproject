import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main(List<String> args) {
  runApp(Mapping());
}

class Mapping extends StatelessWidget {
  final List<Map<String, dynamic>> myList = [
    {
      "Name": "Ikhvan",
      "Age": 19,
      "favColor": [
        "Red",
        "blue",
        "green",
        "Red",
        "blue",
        "green",
        "Red",
        "blue",
        "green"
      ],
    },
    {
      "Name": "Rifki",
      "Age": 19,
      "favColor": ["white", "oranye", "green"],
    },
    {
      "Name": "Ikhvan",
      "Age": 19,
      "favColor": [
        "Red",
        "blue",
        "green",
        "Red",
        "blue",
        "green",
        "Red",
        "blue",
        "green"
      ],
    },
    {
      "Name": "Rifki",
      "Age": 19,
      "favColor": ["white", "oranye", "green"],
    },
    {
      "Name": "Ikhvan",
      "Age": 19,
      "favColor": [
        "Red",
        "blue",
        "green",
        "Red",
        "blue",
        "green",
        "Red",
        "blue",
        "green"
      ],
    },
    {
      "Name": "Rifki",
      "Age": 19,
      "favColor": ["white", "oranye", "green"],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ID Apps'),
        ),
        body: ListView(
          children: myList.map((data) {
            print(data["favColor"]);
            List myfavcolor = data["favColor"];
            return Card(
              margin: EdgeInsets.all(20),
              color: Colors.black.withOpacity(0.1),
              child: Container(
                margin: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //row
                    Row(
                      children: [
                        CircleAvatar(),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Name : ${data['Name']}"),
                            Text("Age : ${data['Age']}"),
                          ],
                        ),
                      ],
                    ),
                    //favColor
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: myfavcolor.map((color) {
                          return Container(
                            color: Colors.amber,
                            margin: EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 8,
                            ),
                            padding: EdgeInsets.all(10),
                            child: Text(color),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
