import 'package:flutter/cupertino.dart';

class AlarmInfo {
  DateTime alarmDataTime;
  String description;
  bool? isActive;
  List<Color>? gradientColor;
  AlarmInfo(this.alarmDataTime,
      {required this.description, required this.gradientColor});
}
