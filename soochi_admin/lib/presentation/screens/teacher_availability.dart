import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soochi_admin/presentation/custom/AddClasses.dart';
import 'package:soochi_admin/presentation/custom/CustomTextField.dart';
import 'package:soochi_admin/presentation/screens/add_constraints.dart';

import '../../utils/styles.dart';

class TeacherAvailability extends StatefulWidget {
  static const String routeNamed = 'TeacherAvailability';
  @override
  State<TeacherAvailability> createState() => _TeacherAvailabilityState();
}

class _TeacherAvailabilityState extends State<TeacherAvailability> {
  var colorList = [Styles.redCard, Styles.blueCard, Styles.yellowCard];
  Map<String, dynamic> teacher_availability = {
    "Mr.Gaurav Vats": [1, 1, 1, 1, 1],
    "Ms.Lopamudra Mohanty": [1, 1, 1, 1, 1],
    "Mr.Rohit Vashisht": [1, 1, 1, 1, 1],
    "Ms.Mansi Mahendru": [1, 1, 1, 1, 1],
    "Ms.Disha Mohini Pathak": [1, 1, 1, 1, 1],
    "Mr.Rahul Kumar Sharma": [1, 1, 1, 1, 1],
    "Mr.Pradeep Sharma": [1, 1, 1, 1, 1],
    "Ms.Vanshika Rastogi": [1, 1, 1, 1, 1],
    "Mr.Gagan Thakral": [1, 1, 1, 1, 1]
  };
  List<int> visible = [0, 0, 0, 0, 0, 0, 0, 0, 0];
  var dayList = [
    "MON",
    "TUE",
    "WED",
    "THU",
    "FRI",
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Teacher Availability",
          style: GoogleFonts.poppins(
              fontSize: 22, fontWeight: FontWeight.w500, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // SizedBox(
              //   child: Text(
              //     "Teachers",
              //     style: GoogleFonts.poppins(
              //         fontSize: 22, fontWeight: FontWeight.w600),
              //   ),
              // ),
              SizedBox(height: 8),
              for (int i = 0; i < teacher_availability.length; i++)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: (() {
                          setState(() {
                            (visible[i] == 1) ? visible[i] = 0 : visible[i] = 1;
                            print(visible);
                          });
                        }),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: colorList[i % 3],
                          ),
                          // width: size.width * 0.8,
                          height: 50,
                          child: Center(
                            child: Text(
                              teacher_availability.entries.toList()[i].key,
                              style: GoogleFonts.poppins(
                                  fontSize: 18, fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: (visible[i] == 1) ? true : false,
                        child: Row(
                          children: [
                            for (int j = 0; j < 5; j++)
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Column(
                                  children: [
                                    SizedBox(height: 2),
                                    Text(
                                      dayList[j],
                                      style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Checkbox(
                                        activeColor: Colors.amber,
                                        value: (teacher_availability.values
                                                    .toList()[i][j]) ==
                                                1
                                            ? true
                                            : false,
                                        onChanged: (val) {
                                          setState(() {
                                            teacher_availability.values
                                                    .toList()[i][j] =
                                                (val == true) ? 1 : 0;
                                          });
                                        }),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.,
      floatingActionButton: FloatingActionButton(
        // isExtended: true,
        child: Icon(Icons.arrow_forward_rounded),
        backgroundColor: Colors.amber,
        onPressed: () {
          Navigator.pushNamed(context, AddConstraints.routeNamed);
        },
      ),
    );
  }
}
