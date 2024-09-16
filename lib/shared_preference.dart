import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(List<String> args) {
  runApp(sharedPreference());
}

class sharedPreference extends StatefulWidget {
  const sharedPreference({super.key});

  @override
  State<sharedPreference> createState() => _sharedPreferenceState();
}

class _sharedPreferenceState extends State<sharedPreference> {
  int counter = 0;

  bool isDark = false;

  Future<void> setPreference() async {
    final jembatan = await SharedPreferences.getInstance();

    if (jembatan.containsKey('myData')) {
      jembatan.clear();
    }

    final myData = json.encode({
      'counter': counter.toString(),
      'isDark': isDark.toString(),
    });

    jembatan.setString('myData', myData);
    setState(() {});
  }

  Future<void> getPreference() async {
    final jembatan = await SharedPreferences.getInstance();

    if (jembatan.containsKey('myData')) {
      // Menangani String nullable dari getString
      final myDataString = jembatan.getString('myData') ??
          '{}'; // Nilai default diberikan jika null
      final myData = json.decode(myDataString) as Map<String, dynamic>;

      counter = int.parse(myData["counter"]);
      isDark = myData["isDark"] == "true" ? true : false;
    }
  }

  void minus() {
    counter = counter - 1;
    setPreference();
  }

  void add() {
    counter = counter + 1;
    setPreference();
  }

  void changeTheme() {
    isDark = !isDark;
    setPreference();
  }

  void refresh() {
    counter = 0;
    isDark = false;
    setPreference();
  }

  ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.amber,
    primarySwatch: Colors.amber,
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white,
          side: BorderSide(
            color: Colors.white,
            width: 2,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          )),
    ),
  );

  ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.amber,
    primarySwatch: Colors.amber,
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
          foregroundColor: Colors.black,
          side: BorderSide(
            color: Colors.black,
            width: 2,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          )),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getPreference(),
        builder: (context, _) => MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: isDark ? dark : light,
              home: Scaffold(
                appBar: AppBar(
                  title: Text("Counter App"),
                  actions: [
                    IconButton(onPressed: refresh, icon: Icon(Icons.refresh))
                  ],
                ),
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Angka saat ini adalah : $counter",
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          OutlinedButton(
                            onPressed: minus,
                            child: Icon(Icons.remove),
                          ),
                          OutlinedButton(
                            onPressed: add,
                            child: Icon(Icons.add),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: changeTheme,
                  child: Icon(Icons.color_lens),
                ),
              ),
            ));
  }
}
