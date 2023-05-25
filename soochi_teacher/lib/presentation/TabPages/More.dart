import 'dart:convert';
import 'dart:math';
import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soochi_teacher/presentation/custom/TeacherCard.dart';
import 'package:soochi_teacher/utils/global.dart';
import '../../model/data_model.dart';
import '../../model/sheets_model.dart';
import '../../services/sheet_api.dart';
import '../../utils/styles.dart';
import 'package:flutter/services.dart' as rootbundle;

import '../custom/PeriodCard.dart';

class More extends StatefulWidget {
  static const String routeNamed = 'Home';
  @override
  State<More> createState() => _MoreState();
}

//  CalendarControllerProvider.of(context).controller.add(event);
class _MoreState extends State<More> {
  var colorList = [Styles.redCard, Styles.blueCard, Styles.yellowCard];
  late Map<String, Map<String, Map<String, String>>> schedule;

  @override
  void initState() {
    schedule = getTeacherSchedule(teacherName);
    print(schedule.values.toList().toString());
    super.initState();
  }

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Weekly Schedule",
            style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: Styles.textColorMain)),
      ),
      body: Container(
        height: size.height,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            for (int i = 0; i < schedule.keys.toList().length; i++)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width - 32,
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                            child: Text(schedule.keys.toList()[i].toString(),
                                style: GoogleFonts.poppins(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w400,
                                    color: Styles.textColorMain))),
                      ),
                      SizedBox(height: 8),
                      for (int j = 0;
                          j < schedule.values.toList()[i].keys.toList().length;
                          j++)
                        TeacherCard(
                          day: schedule.values
                              .toList()[i]
                              .values
                              .toList()[j]
                              .values
                              .toList()[0]
                              .toString(),
                          facultyName: teacherName,
                          subjectName: schedule.values
                              .toList()[i]
                              .values
                              .toList()[j]
                              .values
                              .toList()[1]
                              .toString(),
                          timeStart: schedule.values
                              .toList()[i]
                              .keys
                              .toList()[j]
                              .toString()
                              .split("-")[0],
                          timeEnd: schedule.values
                              .toList()[i]
                              .keys
                              .toList()[j]
                              .toString()
                              .split("-")[1],
                          color: colorList[j % 3],
                        )
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Map<String, Map<String, Map<String, String>>> getTeacherSchedule(
      String teacherName) {
    Map<String, Map<String, String>> schedule_CE = {
      "Monday": {
        "8:50-9:40": "Computer Network",
        "9:40-10:30": "Computer Network",
        "10:30-10:40": "Break",
        "10:40-11:30": "HET",
        "11:30-12:20": "SPM",
        "12:20-1:10": "Problem Solving",
        "1:10-2:00": "Break",
        "2:00-2:50": "Image Processing",
        "2:50-3:40": "Image Processing",
        "3:40-4:30": "WT Lab"
      },
      "Tuesday": {
        "8:50-9:40": "Computer Network",
        "9:40-10:30": "Computer Network",
        "10:30-10:40": "Break",
        "10:40-11:30": "SPM",
        "11:30-12:20": "HET",
        "12:20-1:10": "Problem Solving",
        "1:10-2:00": "Break",
        "2:00-2:50": "Image Processing",
        "2:50-3:40": "Image Processing",
        "3:40-4:30": "CN Lab"
      },
      "Wednesday": {
        "8:50-9:40": "Web Technology",
        "9:40-10:30": "Web Technology",
        "10:30-10:40": "Break",
        "10:40-11:30": "CN Lab",
        "11:30-12:20": "CN Lab",
        "12:20-1:10": "Software Engineering",
        "1:10-2:00": "Break",
        "2:00-2:50": "Computer Network",
        "2:50-3:40": "Computer Network",
        "3:40-4:30": "Web Technology"
      },
      "Thursday": {
        "8:50-9:40": "Web Technology",
        "9:40-10:30": "Web Technology",
        "10:30-10:40": "Break",
        "10:40-11:30": "CN Lab",
        "11:30-12:20": "CN Lab",
        "12:20-1:10": "Software Engineering",
        "1:10-2:00": "Break",
        "2:00-2:50": "Computer Network",
        "2:50-3:40": "Computer Network",
        "3:40-4:30": "Problem Solving"
      },
      "Friday": {
        "8:50-9:40": "Software Engineering",
        "9:40-10:30": "Software Engineering",
        "10:30-10:40": "Break",
        "10:40-11:30": "WT Lab",
        "11:30-12:20": "WT Lab",
        "12:20-1:10": "HET",
        "1:10-2:00": "Break",
        "2:00-2:50": "SPM",
        "2:50-3:40": "SPM",
        "3:40-4:30": "Problem Solving"
      }
    };
    Map<String, Map<String, String>> schedule_CEIT = {
      "Monday": {
        "8:50-9:40": "WT Lab",
        "9:40-10:30": "WT Lab",
        "10:30-10:40": "Break",
        "10:40-11:30": "Web Technology",
        "11:30-12:20": "Web Technology",
        "12:20-1:10": "Software Engineering",
        "1:10-2:00": "Break",
        "2:00-2:50": "Software Engineering",
        "2:50-3:40": "Software Engineering",
        "3:40-4:30": "HET"
      },
      "Tuesday": {
        "8:50-9:40": "Problem Solving",
        "9:40-10:30": "Problem Solving",
        "10:30-10:40": "Break",
        "10:40-11:30": "Software Engineering",
        "11:30-12:20": "CN Lab",
        "12:20-1:10": "CN Lab",
        "1:10-2:00": "Break",
        "2:00-2:50": "HET",
        "2:50-3:40": "HET",
        "3:40-4:30": "Image Processing"
      },
      "Wednesday": {
        "8:50-9:40": "Software Engineering",
        "9:40-10:30": "Software Engineering",
        "10:30-10:40": "Break",
        "10:40-11:30": "Image Processing",
        "11:30-12:20": "Image Processing",
        "12:20-1:10": "Software Engineering",
        "1:10-2:00": "Break",
        "2:00-2:50": "Computer Network",
        "2:50-3:40": "Computer Network",
        "3:40-4:30": "HET"
      },
      "Thursday": {
        "8:50-9:40": "Web Technology",
        "9:40-10:30": "Web Technology",
        "10:30-10:40": "Break",
        "10:40-11:30": "SPM",
        "11:30-12:20": "SPM",
        "12:20-1:10": "Web Technology",
        "1:10-2:00": "Break",
        "2:00-2:50": "HET",
        "2:50-3:40": "HET",
        "3:40-4:30": "Image Processing"
      },
      "Friday": {
        "8:50-9:40": "Software Engineering",
        "9:40-10:30": "Software Engineering",
        "10:30-10:40": "Break",
        "10:40-11:30": "Image Processing",
        "11:30-12:20": "Image Processing",
        "12:20-1:10": "Computer Network",
        "1:10-2:00": "Break",
        "2:00-2:50": "Problem Solving",
        "2:50-3:40": "Problem Solving",
        "3:40-4:30": "Web Technology"
      }
    };
    Map<String, Map<String, String>> schedule_CS = {
      "Monday": {
        "8:50-9:40": "SPM",
        "9:40-10:30": "SPM",
        "10:30-10:40": "Break",
        "10:40-11:30": "Problem Solving",
        "11:30-12:20": "Problem Solving",
        "12:20-1:10": "Web Technology",
        "1:10-2:00": "Break",
        "2:00-2:50": "Software Engineering",
        "2:50-3:40": "Software Engineering",
        "3:40-4:30": "HET"
      },
      "Tuesday": {
        "8:50-9:40": "CN Lab",
        "9:40-10:30": "CN Lab",
        "10:30-10:40": "Break",
        "10:40-11:30": "WT Lab",
        "11:30-12:20": "WT Lab",
        "12:20-1:10": "Image Processing",
        "1:10-2:00": "Break",
        "2:00-2:50": "Computer Network",
        "2:50-3:40": "Computer Network",
        "3:40-4:30": "Web Technology"
      },
      "Wednesday": {
        "8:50-9:40": "Software Engineering",
        "9:40-10:30": "Software Engineering",
        "10:30-10:40": "Break",
        "10:40-11:30": "SPM",
        "11:30-12:20": "SPM",
        "12:20-1:10": "Image Processing",
        "1:10-2:00": "Break",
        "2:00-2:50": "Computer Network",
        "2:50-3:40": "Computer Network",
        "3:40-4:30": "Web Technology"
      },
      "Thursday": {
        "8:50-9:40": "Web Technology",
        "9:40-10:30": "Web Technology",
        "10:30-10:40": "Break",
        "10:40-11:30": "HET",
        "11:30-12:20": "HET",
        "12:20-1:10": "Software Engineering",
        "1:10-2:00": "Break",
        "2:00-2:50": "Computer Network",
        "2:50-3:40": "Computer Network",
        "3:40-4:30": "SPM"
      },
      "Friday": {
        "8:50-9:40": "SPM",
        "9:40-10:30": "SPM",
        "10:30-10:40": "Break",
        "10:40-11:30": "Problem Solving",
        "11:30-12:20": "Problem Solving",
        "12:20-1:10": "Computer Network",
        "1:10-2:00": "Break",
        "2:00-2:50": "Software Engineering",
        "2:50-3:40": "Software Engineering",
        "3:40-4:30": "HET"
      }
    };
    Map<String, String> mapping = {
      "Software Engineering": "Mr.Rohit Vashisht",
      "Web Technology": "Ms.Lopamudra Mohanty",
      "Computer Network": "Mr.Gaurav Vats",
      "Image Processing": "Ms.Disha Mohini Pathak",
      "WT Lab": "Ms.Lopamudra Mohanty",
      "CN Lab": "Mr.Gaurav Vats",
      "ITC": "Mr.Pradeep Sharma",
      "SPM": "Ms.Mansi Mahendru",
      "Problem Solving": "Mr. Rohit Vashisht",
      "HET": "Mr. Pradeep Sharma",
    };
    Map<String, List<String>> scheduleByTeacher = {};

    // Loop through each day of the week in each class
    Map<String, Map<String, Map<String, String>>> lectureMap = {
      "Computer Engineering": {},
      "CE&IT": {},
      "Computer Science": {}
    };
    for (var schedule in [schedule_CE, schedule_CEIT, schedule_CS]) {
      for (var day in schedule.keys) {
        for (var time in schedule[day]!.keys) {
          var subject = schedule[day]![time];
          var className = '';
          if (schedule == schedule_CE) {
            className = 'Computer Engineering';
          } else if (schedule == schedule_CEIT) {
            className = 'CE&IT';
          } else if (schedule == schedule_CS) {
            className = 'Computer Science';
          }
          var teacher = mapping[subject];
          if (teacher == teacherName) {
            if (!lectureMap[className]!.containsKey(time)) {
              lectureMap[className]![time] = {};
            }
            lectureMap[className]![time]!['day'] = day;
            lectureMap[className]![time]!['subject'] = subject!;
          }
        }
      }
    }
    return lectureMap;
  }

  // Future<List<SheetModel>> readJsonData() async {
  //   final jsondata = await rootbundle.rootBundle.loadString('json/sheet.json');
  //   // print(jsondata);
  //   final list = json.decode(jsondata) as List<dynamic>;
  //   List<SheetModel> res = [];
  //   for (var item in list) {
  //     res.add(SheetModel.fromJson(item));
  //   }
  //   return res;
  //   // return list.map((e) => DataModel.fromJson(e)).toList();
  // }
}

// timify(List<String>? time, int i) {
//   List<String> periods;
//   var j = 1;
//   for (var i = 0; i < time!.length; i++) {
//     var t = time[i].split(" ");
//     if(t.length > 1){

//     }
//     else{
//       return "Break";
//     }
//     // if (time[i].startsWith(RegExp("[0-9]"))) {
//     //   var temp = time[i].split(" "); // 1(8:50-9:40)
//     //   var x = temp[1];
//     }
//   }
//   return periods;
// }
