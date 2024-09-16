import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
  Future<Map<String, dynamic>> ambilData() async {
    try {
      var hasilGet = await http.get(
        Uri.parse("https://reqres.in/api/users/2"),
      );

      if (hasilGet.statusCode >= 200 && hasilGet.statusCode < 300) {
        var data = json.decode(hasilGet.body)["data"] as Map<String, dynamic>;
        return data;
      } else {
        throw (hasilGet.statusCode);
      }
    } catch (err) {
      throw (err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Future Builder"),
        backgroundColor: Colors.blueAccent,
      ),
      body: FutureBuilder(
        future: ambilData(),
        builder: (context, snapshot) {
          if (snapshot.error != null) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            print(snapshot.data?["first_name"]);
            return Column(
              children: [
                Text(
                  "${snapshot.data?["first_name"]} ${snapshot.data?["last_name"]}",
                  style: TextStyle(
                    fontSize: 35,
                  ),
                ),
              ],
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: ambilData),
    );
  }
}
