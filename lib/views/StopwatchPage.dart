
import 'package:do_alarm/data.dart';
import 'package:do_alarm/theme/themeData.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StopwatchPage extends StatefulWidget {
  @override
  _StopwatchPageState createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage>  with SingleTickerProviderStateMixin{

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
              'Stopwatch',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: CustomColors.primaryTextColor,
                  fontSize: 24),
            ),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}