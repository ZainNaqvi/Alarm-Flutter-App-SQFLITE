import 'package:digital_alarm_app/enums.dart';
import 'package:flutter/cupertino.dart';

class MenuInfo extends ChangeNotifier {
  MenuType menuType;
  String? title;
  String? imageSource;
  MenuInfo(this.menuType, [this.title, this.imageSource]);
}
