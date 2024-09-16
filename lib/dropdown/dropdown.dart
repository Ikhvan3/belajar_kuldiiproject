import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

void main(List<String> args) {
  runApp(DropDownApp());
}

class DropDownApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeDropdown(),
    );
  }
}

class HomeDropdown extends StatefulWidget {
  @override
  State<HomeDropdown> createState() => _HomeDropdownState();
}

class _HomeDropdownState extends State<HomeDropdown> {
  List<String> data = ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Template"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: DropdownSearch<String>(
            popupProps: PopupProps.menu(
              showSelectedItems: true,
              disabledItemFn: (String s) => s.startsWith('I'),
            ),
            clearButtonProps: ClearButtonProps(isVisible: true),
            items: data,
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                labelText: "Menu mode",
                hintText: "country in menu mode",
              ),
            ),
            onChanged: print,
            // selectedItem: "Brazil",
          ),
        ),
      ),
    );
  }
}
