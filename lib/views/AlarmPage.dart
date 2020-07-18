
import 'package:do_alarm/data.dart';
import 'package:do_alarm/theme/themeData.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AlarmPage extends StatefulWidget {
  @override
  _AlarmPageState createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage>with SingleTickerProviderStateMixin  {
  AnimationController _pageAnimatonController;
  Animation _animation;
  @override
  void initState() {
    _pageAnimatonController  = AnimationController(
        vsync: this,
        duration: Duration(seconds: 1)
    );

    _animation = Tween(
        begin: 0.0,
        end:  1.0
    ).animate(_pageAnimatonController);

    _pageAnimatonController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _pageAnimatonController.dispose();
    super.dispose();
  }
  
  
  
  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 64),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Alarm',
              style: TextStyle(
                  fontFamily: 'avenir',
                  fontWeight: FontWeight.w700,
                  color: CustomColors.primaryTextColor,
                  fontSize: 24),
            ),
            Expanded(
              child: ListView(
                children: alarms.map<Widget>((alarm) {
                  var alarmTime =
                  DateFormat('hh:mm aa').format(alarm.alarmDateTime);
                  return Container(
                    margin: const EdgeInsets.only(bottom: 32),
                    padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: alarm.gradientColors,
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: alarm.gradientColors.last.withOpacity(0.4),
                          blurRadius: 8,
                          spreadRadius: 2,
                          offset: Offset(4, 4),
                        ),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.label,
                                  color: Colors.white,
                                  size: 24,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  alarm.description,
                                  style: TextStyle(
                                      color: Colors.white, fontFamily: 'avenir'),
                                ),
                              ],
                            ),
                            Switch(
                              onChanged: (bool value) {},
                              value: true,
                              activeColor: Colors.white,
                            ),
                          ],
                        ),
                        Text(
                          'Mon-Fri',
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'avenir'),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              alarmTime,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'avenir',
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              size: 36,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }).followedBy([
                  if (alarms.length < 5)
                    DottedBorder(
                      strokeWidth: 2,
                      color: CustomColors.clockOutline,
                      borderType: BorderType.RRect,
                      radius: Radius.circular(24),
                      dashPattern: [5, 4],
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: CustomColors.clockBG,
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                        ),
                        child: FlatButton(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 16),
                          onPressed: () {
                            //scheduleAlarm();
                          },
                          child: Column(
                            children: <Widget>[
                              Image.asset(
                                'assets/add_alarm.png',
                                scale: 1.5,
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Add Alarm',
                                style: TextStyle(
                                    color: Colors.white, fontFamily: 'avenir'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  else
                    Text('Only 5 alarms allowed!'),
                ]).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}