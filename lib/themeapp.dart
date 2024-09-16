import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(ThemeApp());
}

class ThemeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeThemeApp(),
      theme: ThemeData(
        brightness: Brightness.light,
        // visualDensity: VisualDensity.adaptivePlatformDensity,
        // visualDensity: VisualDensity.compact,
        // visualDensity: VisualDensity.comfortable,
        // visualDensity: VisualDensity(horizontal: 4, vertical: 4),
        // primaryColor: Colors.red,
        primarySwatch: Colors.amber,
        // primaryColorLight: Colors.amber,
        primaryColor: Colors.blue,
        textTheme: TextTheme(
          bodyMedium: TextStyle(
            color: Colors.amber,
          ),
        ),

        appBarTheme: AppBarTheme(
          color: Colors.amber,
          titleTextStyle: TextStyle(
            color: Color.fromARGB(255, 218, 58, 10),
            fontSize: 35,
          ),
        ),
      ),
    );
  }
}

class HomeThemeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Theme App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "This is a text",
              style: TextStyle(
                  fontSize: 35, color: Theme.of(context).primaryColor),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "This is a text",
              style: TextStyle(fontSize: 35),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "Button",
                style: TextStyle(fontSize: 35),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.mediation),
      ),
    );
  }
}
