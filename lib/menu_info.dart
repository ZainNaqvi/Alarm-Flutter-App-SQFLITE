import 'package:digital_alarm_app/enums.dart';
import 'package:flutter/cupertino.dart';

class MenuInfo extends ChangeNotifier {
  MenuType menuType;
  String title;
  String imageSource;
  MenuInfo(this.menuType, {required this.title, required this.imageSource});
  updataMenu(MenuInfo menuInfo) {
    this.menuType = menuInfo.menuType;
    this.title = menuInfo.title;
    this.imageSource = menuInfo.imageSource;
// Important
    notifyListeners();
  }
}
