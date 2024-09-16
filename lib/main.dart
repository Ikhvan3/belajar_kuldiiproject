import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text("My App"),
            backgroundColor: Colors.amber,
          ),
          body: ListView(
            children: [
              ListTile(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                title: Text("Ikhvan Rifki"),
                subtitle: Text(
                  "This is subtitle okaysnkfdnsjfnjdnfjnsdnfsndkfnsnjfnjsnfjnjsnfjsjfjdnfjdjfjdsjfdjjdsjgds",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                leading: CircleAvatar(),
                trailing: Text("10.00 PM"),
                //onTap: () {
                //return;
                //},
                //tileColor: Colors.amber,
                //dense: true,
              ),
              Divider(
                color: Colors.black,
              ),
              ListTile(
                title: Text("Ikhvan Rifki"),
                subtitle: Text("This is subtitle okay..."),
                leading: CircleAvatar(),
                trailing: Text("10.00 PM"),
              ),
              Divider(
                color: Colors.black,
              ),
              ListTile(
                title: Text("Ikhvan Rifki"),
                subtitle: Text("This is subtitle okay..."),
                leading: CircleAvatar(),
                trailing: Text("10.00 PM"),
              ),
              Divider(
                color: Colors.black,
              ),
              ListTile(
                title: Text("Ikhvan Rifki"),
                subtitle: Text("This is subtitle okay..."),
                leading: CircleAvatar(),
                trailing: Text("10.00 PM"),
              ),
              Divider(
                color: Colors.black,
              ),
              ListTile(
                title: Text("Ikhvan Rifki"),
                subtitle: Text("This is subtitle okay..."),
                leading: CircleAvatar(),
                trailing: Text("10.00 PM"),
              ),
              Divider(
                color: Colors.black,
              ),
            ],
          )),
    );
  }
}
