import 'package:belajar_kuldii/lifecicle_widget/page/otherpage.dart';
import 'package:flutter/material.dart';

class WidgetCounter extends StatefulWidget {
  const WidgetCounter({
    super.key,
    required this.counter,
  });

  final int counter;

  @override
  State<WidgetCounter> createState() => _WidgetCounterState();
}

class _WidgetCounterState extends State<WidgetCounter> {
  @override
  void initState() {
    super.initState();
    print("initState()");
  }

  @override
  void didChangeDependencies() {
    print("didChangeDependencies()");
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant WidgetCounter oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("Old : ${oldWidget.counter}");
    print("didUpdateWidget()");
    print("New : ${widget.counter}");
  }

  @override
  void deactivate() {
    print("deactivate()");
    super.deactivate();
  }

  @override
  void dispose() {
    print("dispose()");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${widget.counter}",
            style: TextStyle(
              fontSize: 35,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          OutlinedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, OtherPage.routeName,
                  arguments: widget.counter);
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
