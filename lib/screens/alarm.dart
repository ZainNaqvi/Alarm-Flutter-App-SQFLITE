import 'package:digital_alarm_app/colors/theme_data.dart';
import 'package:digital_alarm_app/data.dart';
import 'package:digital_alarm_app/model/alarm_info.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AlarmScreen extends StatelessWidget {
  const AlarmScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 64, horizontal: 30),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Alarm',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Expanded(
          child: ListView(
            children: alarms
                .map<Widget>(
              (e) => Container(
                margin: EdgeInsets.only(bottom: 32),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.red,
                  gradient: LinearGradient(
                    colors: GradientColors.fire,
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: GradientColors.fire.last.withOpacity(0.4),
                      blurRadius: 8,
                      spreadRadius: 2,
                      offset: Offset(4, 4),
                    ),
                  ],
                  borderRadius: BorderRadius.all(
                    Radius.circular(24),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.label,
                              color: Colors.white,
                              size: 24,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              alarms.map((e) => e.description).first.toString(),
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Switch(
                          activeColor: Colors.white,
                          value: true,
                          onChanged: (bool value) {},
                        ),
                      ],
                    ),
                    Text(
                      "Mon - Fri",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "07:00 AM",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: Colors.white,
                          size: 36,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
                .followedBy([
              DottedBorder(
                strokeWidth: 2,
                dashPattern: [8, 4],
                color: CustomColors.clockBG,
                borderType: BorderType.RRect,
                radius: Radius.circular(32),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: CustomColors.clockBG,
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: FlatButton(
                    padding: EdgeInsets.all(24),
                    onPressed: () {},
                    child: Column(
                      children: [
                        Image.asset('add_alarm.png'),
                        SizedBox(
                          height: 14,
                        ),
                        Text(
                          "Add Alarm",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ]).toList(),
          ),
        ),
      ]),
    );
  }
}
