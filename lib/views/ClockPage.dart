import 'package:do_alarm/ClockView.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ClockPage extends StatefulWidget {


  @override
  _ClockPageState createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> with SingleTickerProviderStateMixin{
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
    DateTime  now = DateTime.now();
    var _formattedTime  = DateFormat('HH:mm').format(now);
    var _formattedDate  = DateFormat('EEE, d MMMM').format(now);
    var _timeZoneString =  now.timeZoneOffset.toString().split('.').first;
    var _offsetSign  = "";
    if(!_timeZoneString.startsWith('-')){
      _offsetSign = "+";
    }
    return FadeTransition(
      opacity: _animation,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 32 ,vertical: 64),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Text("Clock",
                  style: TextStyle(color: Colors.white,fontSize: 24)
              ),
            ),
            Flexible(
              flex: 2 ,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(_formattedTime,
                      style: TextStyle(color: Colors.white,fontSize: 64)
                  ),
                  Text(_formattedDate,
                      style: TextStyle(color: Colors.white,fontSize: 20)
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 5,
              fit: FlexFit.tight,
              child: Align(
                  alignment: Alignment.center,
                  child: ClockView(
                    size:  MediaQuery.of(context).size.height / 4,
                  )),
            ),
            Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Timezone",
                      style: TextStyle(color: Colors.white,fontSize: 14)
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.language,
                        color: Colors.white,
                      ),
                      SizedBox(width: 16),
                      Text("UTC $_offsetSign $_timeZoneString"  ,
                          style: TextStyle(color: Colors.white,fontSize: 14)
                      ),
                    ],
                  )
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}