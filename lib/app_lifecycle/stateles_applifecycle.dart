import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(statelesApp());
}

class statelesApp extends StatelessWidget with WidgetsBindingObserver {
  HomePageStateles() {
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePageStateles(),
    );
  }
}

class HomePageStateles extends StatelessWidget {
  const HomePageStateles({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
