// ignore_for_file: unused_import, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isContainerVisible = false;

  List months = [
    'January',
    'Fibruary',
    'march',
    'april',
    'may',
    'june',
    'jully',
    'augist',
    'september',
    'october',
    'november',
    'december'
  ];
  List month_day_count = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

  int YEAR = 365;
  List fixedMEDS = [1, 75];

  void _toggleContainer() {
    setState(() {
      _isContainerVisible = !_isContainerVisible;
    });
  }

  Widget _buildContainer() {
    return Container(
      child: distance(months, month_day_count, YEAR, fixedMEDS),
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My moms meds app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _toggleContainer,
                child: const Text("click me mama <3"),
              ),
              if (_isContainerVisible) _buildContainer(),
            ],
          ),
        ));
  }
}

Text distance(months, month_day_count, YEAR, fixedMEDS) {
  DateTime now = DateTime.now();
  String formattedDate = "${now.month}";
  String currentMonth = months[int.parse(formattedDate) - 1];
  String days = month_day_count[int.parse(formattedDate) - 1].toString();
  String formattedDay = "${now.day}";
  // its holds the distance from the fixed point to this day
  // int sum = numbers.reduce((a, b) => a + b);
  // print(sum); // prints 15
  int distanceFrom = month_day_count
          .sublist(0, int.parse(formattedDate) - 1)
          .reduce((a, b) => a + b) +
      int.parse(formattedDay) -
      1;

  if (distanceFrom % 2 == 0) {
    return const Text(
      "50",
      style: TextStyle(fontSize: 100),
    );
  } else {
    return const Text(
      "75",
      style: TextStyle(fontSize: 100),
    );
  }
}
