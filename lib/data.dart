import 'package:digital_alarm_app/colors/theme_data.dart';
import 'package:digital_alarm_app/enums.dart';
import 'package:digital_alarm_app/menu_info.dart';
import 'package:digital_alarm_app/model/alarm_info.dart';

List<MenuInfo> menuItems = [
  MenuInfo(MenuType.clock,
      title: "Clock", imageSource: 'assets/clock_icon.png'),
  MenuInfo(MenuType.alarm,
      title: "Alarm", imageSource: 'assets/alarm_icon.png'),
  MenuInfo(MenuType.timer,
      title: "Timer", imageSource: 'assets/timer_icon.png'),
  MenuInfo(MenuType.stopwatch,
      title: "Stopwatch", imageSource: 'assets/stopwatch_icon.png'),
];
List<AlarmInfo> alarms = [
  AlarmInfo(
    DateTime.now().add(Duration(hours: 1)),
    description: 'office',
    gradientColor: GradientColors.mango,
  ),
  AlarmInfo(
    DateTime.now().add(Duration(hours: 2)),
    description: 'Sport',
    gradientColor: GradientColors.sky,
  ),
];
