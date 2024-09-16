import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(Tabbar());
}

class Tabbar extends StatelessWidget {
  List<Tab> myTab = [
    Tab(
      iconMargin: EdgeInsets.only(left: 55, right: 70),
      text: "Tab 1",
      icon: Icon(Icons.access_alarm),
    ),
    Tab(
      text: "data",
    ),
    Tab(
      child: Container(
        height: 500,
        margin: EdgeInsets.only(left: 50, right: 50),
        child: Image.asset('images/bosscha.jpg'),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        initialIndex: 2,
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.blueAccent,
            title: Text("My apps"),
            bottom: TabBar(
              labelColor: Colors.amber,
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              unselectedLabelStyle: TextStyle(
                fontWeight: FontWeight.normal,
              ),
              //indicatorColor: Color.fromARGB(255, 5, 249, 208),
              //indicatorWeight: 3,
              indicator: BoxDecoration(
                color: Colors.blueGrey,
                border: Border(
                    bottom: BorderSide(
                  color: Colors.black,
                  width: 5,
                )),
              ),
              tabs: myTab,
            ),
          ),
          body: TabBarView(
            children: [
              Center(
                child: Text(
                  "Tab 1",
                  style: TextStyle(fontSize: 40),
                ),
              ),
              Center(
                child: Text(
                  "Tab 2",
                  style: TextStyle(fontSize: 40),
                ),
              ),
              Center(
                child: Text(
                  "Tab 3",
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
