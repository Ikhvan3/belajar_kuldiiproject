import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(AppDatepicker());
}

class AppDatepicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeDatepicker(),
    );
  }
}

class HomeDatepicker extends StatefulWidget {
  @override
  State<HomeDatepicker> createState() => _HomeDatepickerState();
}

class _HomeDatepickerState extends State<HomeDatepicker> {
  DateTime selectDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Template"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              selectDate.toString(),
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            OutlinedButton(
                onPressed: () {
                  showDatePicker(
                    context: context,
                    initialDate: selectDate,
                    firstDate: DateTime(1999),
                    lastDate: DateTime(2050),
                    // initialDatePickerMode: DatePickerMode.day,
                    // initialEntryMode: DatePickerEntryMode.calendar,
                    // selectableDayPredicate: (day) {
                    //   if ((day.isAfter(
                    //           DateTime.now().subtract(Duration(days: 5)))) &&
                    //       (day.isBefore(
                    //           DateTime.now().add(Duration(days: 2))))) {
                    //     return true;
                    //   }
                    //   return false;
                    // },
                    helpText: "Help Text",
                    cancelText: "Cancel Text",
                    confirmText: "Confirm Text",
                    fieldHintText: "Masukan tanggal lahir anda",
                    fieldLabelText: "field label  Text",
                    builder: (context, child) {
                      return Theme(
                        data: ThemeData.dark(),
                        child: child!,
                      );
                    },
                  ).then((value) {
                    if (value != null)
                      setState(() {
                        selectDate = value;
                      });
                  });
                },
                child: Text("Date Picker")),
          ],
        ),
      ),
    );
  }
}
