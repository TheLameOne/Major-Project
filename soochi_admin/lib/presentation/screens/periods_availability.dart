import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soochi_admin/presentation/custom/AddClasses.dart';
import 'package:soochi_admin/presentation/custom/CustomTextField.dart';
import 'package:soochi_admin/presentation/screens/teacher_availability.dart';

import '../../utils/styles.dart';

class PeriodsAvailability extends StatefulWidget {
  static const String routeNamed = 'PeriodsAvailability';
  @override
  State<PeriodsAvailability> createState() => _PeriodsAvailabilityState();
}

class _PeriodsAvailabilityState extends State<PeriodsAvailability> {
  Map<String, dynamic> time_slot_availability = {
    "8:50-9:40": [1, 1, 1],
    "9:40-10:30": [1, 1, 1],
    "10:40-11:30": [1, 1, 1],
    "11:30-12:20": [1, 1, 1],
    "12:20-1:10": [1, 1, 1],
    "2:00-2:50": [1, 1, 1],
    "2:50-3:40": [1, 1, 1],
    "3:40-4:30": [1, 1, 1]
  };

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
          "Period Availability",
          style: GoogleFonts.poppins(
              fontSize: 22, fontWeight: FontWeight.w500, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: size.width * 0.5,
                    child: Text(
                      "Periods",
                      style: GoogleFonts.poppins(
                          fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    "CE",
                    style: GoogleFonts.poppins(
                        fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(width: 16),
                  Text(
                    "CS",
                    style: GoogleFonts.poppins(
                        fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(width: 16),
                  Text(
                    "CEIT",
                    style: GoogleFonts.poppins(
                        fontSize: 22, fontWeight: FontWeight.w600),
                  )
                ],
              ),
              SizedBox(height: 8),
              for (int i = 0; i < time_slot_availability.length; i++)
                Row(
                  children: [
                    Container(
                      width: size.width * 0.5,
                      child: Text(
                        time_slot_availability.entries.toList()[i].key,
                        style: GoogleFonts.poppins(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                    ),
                    Checkbox(
                        activeColor: Colors.amber,
                        value:
                            (time_slot_availability.values.toList()[i][0]) == 1
                                ? true
                                : false,
                        onChanged: (val) {
                          setState(() {
                            time_slot_availability.values.toList()[i][0] =
                                (val == true) ? 1 : 0;
                          });
                        }),
                    Checkbox(
                        activeColor: Colors.amber,
                        value:
                            (time_slot_availability.values.toList()[i][1]) == 1
                                ? true
                                : false,
                        onChanged: (val) {
                          setState(() {
                            time_slot_availability.values.toList()[i][1] =
                                (val == true) ? 1 : 0;
                          });
                        }),
                    Checkbox(
                        activeColor: Colors.amber,
                        value:
                            (time_slot_availability.values.toList()[i][2]) == 1
                                ? true
                                : false,
                        onChanged: (val) {
                          setState(() {
                            time_slot_availability.values.toList()[i][2] =
                                (val == true) ? 1 : 0;
                          });
                        })
                  ],
                )
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
          Navigator.pushNamed(context, TeacherAvailability.routeNamed);
        },
      ),
    );
  }
}
