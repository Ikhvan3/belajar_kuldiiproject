import 'package:belajar_kuldii/lifecicle_widget/page/otherpage.dart';
import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  static const routerName = '/counter-page';

  CounterPage() {
    print("=====================");
    print("constructor counter page");
  }
  @override
  State<CounterPage> createState() {
    print("createState()");
    return _CounterPageState();
  }
}

class _CounterPageState extends State<CounterPage> {
  int counter = 0;

  @override
  void didChangeDependencies() {
    int numberState = ModalRoute.of(context)!.settings.arguments as int;

    if (numberState != null) {
      counter = numberState;
    }
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print("build()");
    return Scaffold(
      appBar: AppBar(
        title: Text("Template"),
        backgroundColor: Colors.blueAccent,
      ),
      body: WidgetCounter(counter: counter),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter++;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class WidgetCounter extends StatelessWidget {
  const WidgetCounter({
    super.key,
    required this.counter,
  });

  final int counter;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$counter",
            style: TextStyle(
              fontSize: 35,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          OutlinedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, OtherPage.routeName);
            },
            child: Text(
              "Go T o Other Page",
            ),
          ),
        ],
      ),
    );
  }
}
