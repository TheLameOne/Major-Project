import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/styles.dart';
import 'CustomTextField.dart';

class Classes extends StatefulWidget {
  String? subjectName;
  int? initialValue;
  TextEditingController controller;

  Classes({this.initialValue, this.subjectName, required this.controller});

  @override
  State<Classes> createState() => ClassesState();
}

class ClassesState extends State<Classes> {
  var colorList = [Styles.redCard, Styles.blueCard, Styles.yellowCard];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 4),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: colorList[Random().nextInt(colorList.length)],
            ),
            width: MediaQuery.of(context).size.width - 160,
            height: 50,
            child: Center(
              child: Text(
                widget.subjectName!,
                style: GoogleFonts.poppins(
                    fontSize: 18, fontWeight: FontWeight.w400),
              ),
            ),
          ),
          SizedBox(width: 8),
          CustomTextField(
            onChanged: (val) {},
            // initialValue: widget.initialValue!,
            controller: widget.controller,
          ),
          // Container(
          //     decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(20), color: Colors.red),
          //     child: Icon(
          //       Icons.remove,
          //       color: Colors.white,
          //     )),
        ],
      ),
    );
  }
}
