import 'package:belajar_kuldii/lifecicle_widget/page/counterpage.dart';
import 'package:belajar_kuldii/lifecicle_widget/page/otherpage.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(TemplateKuldi());
}

class TemplateKuldi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: CounterPage(), routes: {
      CounterPage.routerName: (ctx) => CounterPage(),
      OtherPage.routeName: (ctx) => OtherPage(),
    });
  }
}
