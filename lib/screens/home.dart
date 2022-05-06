import 'package:digital_alarm_app/screens/clock.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white24,
        body: Column(
          children: [
            CustomScrollView(
              reverse: false,
              slivers: <Widget>[
                SliverAppBar(
                  expandedHeight: 250.0,
                  backgroundColor: Colors.teal,
                  actions: <Widget>[
                    appbarButtons(title: 'Alarm'),
                    appbarButtons(title: 'Clock'),
                    appbarButtons(title: 'Timer'),
                    appbarButtons(title: 'Stopwatch'),
                  ],
                ),
              ],
            ),
          ],
        ));
  }

  Padding appbarButtons({required String title}) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: MaterialButton(
        onPressed: null,
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
