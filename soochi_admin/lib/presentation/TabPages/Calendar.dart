import 'package:event/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:intl/intl.dart' show DateFormat;

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime _currentDate = DateTime(2019, 2, 3);
  DateTime _currentDate2 = DateTime(2019, 2, 3);
  String _currentMonth = DateFormat.yMMM().format(DateTime(2019, 2, 3));
  DateTime _targetDateTime = DateTime(2019, 2, 3);
//  List<DateTime> _markedDate = [DateTime(2018, 9, 20), DateTime(2018, 10, 11)];
  static Widget _eventIcon = new Container(
    decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(1000)),
        border: Border.all(color: Colors.blue, width: 2.0)),
    child: new Icon(
      Icons.person,
      color: Colors.amber,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: 600,
              width: 400,
              child: CalendarCarousel(
                thisMonthDayBorderColor: Colors.grey,
                showIconBehindDayText: true,
                customGridViewPhysics: NeverScrollableScrollPhysics(),
                selectedDayTextStyle: TextStyle(
                  color: Colors.yellow,
                ),
                todayTextStyle: TextStyle(
                  color: Colors.white,
                ),
                daysHaveCircularBorder: false,
                height: 420.0,
                onDayLongPressed: (DateTime date) {
                  print('long pressed date $date');
                },
              )),
        ],
      )),
    );
  }
}
