import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main(List<String> args) {
  runApp(SwitchApp());
}

class SwitchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomeSwitch(),
    );
  }
}

class MyHomeSwitch extends StatefulWidget {
  @override
  State<MyHomeSwitch> createState() => _MyHomeSwitchState();
}

class _MyHomeSwitchState extends State<MyHomeSwitch> {
  bool statusSwitch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Switch"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.grey,
              // height: ,
              // width:
              child: Switch(
                activeColor: Colors.amber,
                activeTrackColor: Colors.green,
                inactiveThumbColor: Colors.indigo,
                inactiveTrackColor: Colors.red,
                activeThumbImage: AssetImage('images/true.png'),
                inactiveThumbImage: AssetImage('images/false.jpg'),
                value: statusSwitch,
                onChanged: (value) {
                  setState(
                    () {
                      statusSwitch = !statusSwitch;
                    },
                  );
                },
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              // if(statusSwitch == true ) "Switch On" else "Switch Off",
              (statusSwitch == true) ? "Switch On" : "Switch Off",

              style: TextStyle(
                fontSize: 35,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
