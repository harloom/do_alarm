

import 'package:do_alarm/alarmInfo.dart';
import 'package:do_alarm/enums.dart';
import 'package:do_alarm/menuInfo.dart';
import 'package:do_alarm/theme/themeData.dart';

List<MenuInfo> menuItems = [
  MenuInfo(MenuType.clock,title: "Clock"),
  MenuInfo(MenuType.alarm,title: "Alarm"),
  MenuInfo(MenuType.timer,title: "Timer"),
  MenuInfo(MenuType.stopwatch,title: "StopWatch"),
];

List<AlarmInfo> alarms = [
  AlarmInfo(DateTime.now().add(Duration(hours: 1)),
      description: 'Office', gradientColors: GradientColors.sky),
  AlarmInfo(DateTime.now().add(Duration(hours: 2)),
      description: 'Sport', gradientColors: GradientColors.sunset),
];

