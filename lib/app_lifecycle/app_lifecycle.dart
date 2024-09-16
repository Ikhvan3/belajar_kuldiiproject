import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(appLifecycle());
}

class appLifecycle extends StatelessWidget {
  const appLifecycle({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeappLifecycle(),
    );
  }
}

class HomeappLifecycle extends StatefulWidget {
  const HomeappLifecycle({super.key});

  @override
  State<HomeappLifecycle> createState() => _HomeappLifecycleState();
}

class _HomeappLifecycleState extends State<HomeappLifecycle>
    with WidgetsBindingObserver {
  int number = 0;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);
    switch (state) {
      case AppLifecycleState.inactive:
        setState(() {
          number = 99;
        });
        break;
      case AppLifecycleState.paused:
        //....
        break;
      case AppLifecycleState.detached:
        //....
        break;
      case AppLifecycleState.resumed:
        //....
        break;
      case AppLifecycleState.hidden:
        //...
        break;
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("COUNTER"),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Text(
          "$number",
          style: TextStyle(
            fontSize: 35,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(
            () {
              number++;
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
