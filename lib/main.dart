import 'package:digital_alarm_app/clock_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();

    var dateFormaterTime = DateFormat('HH:mm').format(DateTime.now());

    var dateFormaterDate = DateFormat('EEE,d MMM').format(DateTime.now());

    var timezoneString =
        DateTime.now().timeZoneOffset.toString().split('.').first;

    var offsetSign = '';
    if (timezoneString.startsWith('-')) offsetSign = "+";
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Color(0xFF2D2F41),
        body: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildMenuButtons('Clock', "assets/clock_icon.png"),
                buildMenuButtons('Alarm', "assets/alarm_icon.png"),
                buildMenuButtons('Timer', "assets/timer_icon.png"),
                buildMenuButtons('Stopwatch', "assets/stopwatch_icon.png"),
              ],
            ),
            VerticalDivider(
              color: Colors.white54,
              width: 1,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(32),
                margin: EdgeInsets.all(0),
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: const Text(
                        'Clock',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            dateFormaterTime,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 54,
                            ),
                          ),
                          Text(
                            dateFormaterDate,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 4,
                      child: Align(
                        alignment: Alignment.center,
                        child: ClockView(
                          size: 350,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Time zone here',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.language,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 24,
                              ),
                              Text(
                                "GMT+" + offsetSign + timezoneString,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextButton buildMenuButtons(String title, String imageURl) {
    return TextButton(
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              imageURl,
              scale: 1.5,
            ),
            SizedBox(
              height: 14,
            ),
            Text(
              title ?? "",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
