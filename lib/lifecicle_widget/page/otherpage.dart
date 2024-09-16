import 'package:belajar_kuldii/lifecicle_widget/page/counterpage.dart';
import 'package:flutter/material.dart';

class OtherPage extends StatelessWidget {
  static const routeName = '/other-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Other Page"),
      ),
      body: Center(
        child: OutlinedButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, CounterPage.routerName,
                arguments: ModalRoute.of(context)!.settings.arguments as int);
          },
          child: Text(
            "Go T o Other Page",
          ),
        ),
      ),
    );
  }
}
