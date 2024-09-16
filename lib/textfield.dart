import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(textField());
}

class textField extends StatelessWidget {
  const textField({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Fitur TextField"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              //decoration
              showCursor: true,
              cursorColor: Colors.amber,
              // cursorWidth: 10,
              // cursorRadius: Radius.circular(20),
              textAlign: TextAlign.start,
              textAlignVertical: TextAlignVertical.center,
              textCapitalization: TextCapitalization.none,

              style: TextStyle(color: Colors.amber, fontSize: 20),

              decoration: InputDecoration(
                fillColor: Colors.amber,
                filled: true,
                icon: Icon(
                  Icons.person,
                  size: 35,
                ),
                border: OutlineInputBorder(),

                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 255, 191, 1)),
                ),

                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: const Color.fromARGB(255, 7, 5, 0)),
                ),

                //prefixText: "Name: ",
                prefixStyle: TextStyle(
                    color: const Color.fromARGB(255, 9, 7, 0),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                // prefix: Icon(
                //   Icons.person,
                //   size: 35,
                // ),

                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.remove_red_eye),
                ),

                hintText: "Please input your name..",
                hintStyle: TextStyle(
                  color: const Color.fromARGB(255, 8, 6, 0),
                ),
                labelText: "Full Name",
                labelStyle: TextStyle(
                  color: const Color.fromARGB(255, 3, 2, 0),
                ),
              ),
              //FITUR
              autocorrect: false,
              // autofocus: false,
              // enableSuggestions: false,
              // enableInteractiveSelection: true,
              // //enabled: ,
              // //obscureText: true,
              // //obscuringCharacter: '*',
              // keyboardType: TextInputType.phone,
              //readOnly: true,
            ),
          ),
        ),
      ),
    );
  }
}
