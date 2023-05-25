import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soochi_admin/presentation/custom/AddClasses.dart';
import 'package:soochi_admin/presentation/custom/CustomTextField.dart';
import 'package:soochi_admin/presentation/screens/periods_availability.dart';

import '../../utils/styles.dart';

class AddClasses extends StatefulWidget {
  static const String routeNamed = 'AddClasses';
  @override
  State<AddClasses> createState() => _AddClassesState();
}

int weeksCountOfWeekday(int weekdayToCnt, int month, int year) {
  assert(weekdayToCnt >= 1 && weekdayToCnt <= 7);
  final DateTime startDate = DateTime(year, month);
  final DateTime endDate =
      DateTime(year, month + 1).subtract(const Duration(days: 1));
  int res = 1;
  int dayOfWeekday;

  if (weekdayToCnt < startDate.weekday) {
    dayOfWeekday = startDate.day + 7 - (startDate.weekday - weekdayToCnt);
  } else {
    dayOfWeekday = 1 + weekdayToCnt - startDate.weekday;
  }

  while (dayOfWeekday + 7 <= endDate.day) {
    res++;
    dayOfWeekday += 7;
  }

  return res;
}

class _AddClassesState extends State<AddClasses> {
  var colorList = [Styles.redCard, Styles.blueCard, Styles.yellowCard];
  var subjectList = [
    "Computer Networks",
    "Web Technology",
    "Software Engineering",
    "SPM",
    "Image Processing",
    "Problem Solving",
    "HET",
    "CN Lab",
    "WT Lab"
  ];

  var initialValue = [5, 5, 5, 3, 3, 2, 2, 4, 4];
  final List<TextEditingController> _controller = [
    for (int i = 0; i < 9; i++) TextEditingController()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Add Classes",
          style: GoogleFonts.poppins(
              fontSize: 22, fontWeight: FontWeight.w500, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          for (int i = 0; i < subjectList.length; i++)
            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 4),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: colorList[i % 3],
                    ),
                    width: MediaQuery.of(context).size.width - 160,
                    height: 50,
                    child: Center(
                      child: Text(
                        subjectList[i],
                        style: GoogleFonts.poppins(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.5, color: Colors.black12),
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromRGBO(255, 255, 255, 0.3),
                    ),
                    child: Center(child: Text(initialValue[i].toString())),
                  ),
                  // CustomTextField(
                  //   onChanged: (val) {
                  //     initialValue[i] = val;
                  //   },
                  //   controller: _controller[i],
                  // ),
                  SizedBox(width: 8),
                  InkWell(
                    onTap: (() {
                      setState(() {
                        initialValue[i] = initialValue[i] + 1;
                      });
                    }),
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.green),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        )),
                  ),
                  SizedBox(width: 8),
                  InkWell(
                    onTap: () {
                      setState(() {
                        (initialValue[i] > 0)
                            ? initialValue[i] = initialValue[i] - 1
                            : print("Error");
                      });
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.red),
                        child: Icon(
                          Icons.remove,
                          color: Colors.white,
                        )),
                  ),
                ],
              ),
            ),
        ]),
      )),
      // floatingActionButtonLocation: FloatingActionButtonLocation.,
      floatingActionButton: FloatingActionButton(
        // isExtended: true,
        child: Icon(Icons.arrow_forward_rounded),
        backgroundColor: Colors.amber,
        onPressed: () {
          Navigator.pushNamed(context, PeriodsAvailability.routeNamed);
        },
      ),
    );
  }
}
