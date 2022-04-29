import 'package:digital_alarm_app/clock_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(
        alignment: Alignment.center,
        color: Color(0xFF2D2F41),
        child: ClockView(),
      ),
    );
  }
}
