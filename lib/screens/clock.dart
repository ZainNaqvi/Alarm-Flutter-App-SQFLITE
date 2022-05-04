import 'package:digital_alarm_app/clock_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ClockScreen extends StatelessWidget {
  const ClockScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();

    var dateFormaterTime = DateFormat('HH:mm').format(DateTime.now());

    var dateFormaterDate = DateFormat('EEE,d MMM').format(DateTime.now());

    var timezoneString =
        DateTime.now().timeZoneOffset.toString().split('.').first;

    var offsetSign = '';
    if (timezoneString.startsWith('-')) offsetSign = "+";
    return Container(
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
    );
  }
}
