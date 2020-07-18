
import 'package:do_alarm/data.dart';
import 'package:do_alarm/enums.dart';
import 'package:do_alarm/menuInfo.dart';
import 'package:do_alarm/theme/themeData.dart';
import 'package:do_alarm/views/AlarmPage.dart';
import 'package:do_alarm/views/ClockPage.dart';
import 'package:do_alarm/views/StopwatchPage.dart';
import 'package:do_alarm/views/TimerPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.pageBackgroundColor,
      body: Row(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: menuItems.map((e) => buildMenuButton(e)).toList(),
          ),
          VerticalDivider(
            color: CustomColors.dividerColor, width: 1,
          ),
          Expanded(
            child: Consumer<MenuInfo>(
                builder: (BuildContext context, MenuInfo value, Widget child) {
                  switch (value.menuType) {
                    case MenuType.stopwatch:
                      return StopwatchPage();
                    case MenuType.alarm:
                      return AlarmPage();
                    case MenuType.timer:
                      return TimerPage();
                    default:
                      return ClockPage();
                  }
                }
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenuButton(MenuInfo _currentMenuInfo) {
    return Consumer<MenuInfo>(
        builder: (BuildContext context, MenuInfo value, Widget child) {
          return FlatButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topRight: Radius.circular(32),
                    bottomLeft: Radius.circular(32))
            ),
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 16),
            color: _currentMenuInfo.menuType == value.menuType ? CustomColors
                .menuBackgroundColor : Colors.transparent,
            onPressed: () {
              var menuInfo = Provider.of<MenuInfo>(context, listen: false);
              menuInfo.updateMenu(_currentMenuInfo);
            },
            child: Column(
              children: <Widget>[
                FlutterLogo(),
                SizedBox(height: 12,),
                Text(_currentMenuInfo.title ?? "",
                  style: TextStyle(color: Colors.white, fontSize: 14),)
              ],
            ),
          );
        }
    );
  }
}



