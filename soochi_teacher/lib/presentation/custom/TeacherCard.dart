import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/global.dart';
import '../../utils/styles.dart';

class TeacherCard extends StatefulWidget {
  late String subjectName;
  // late String subjectCode;
  late String day;
  late String facultyName;
  final String timeStart;
  final String timeEnd;
  // late String lectureHall;
  // final String lectureBlock;
  final Color color;
  // final Function onTap;

  TeacherCard(
      {this.subjectName = "Web Technology",
      // this.subjectCode = "KCS-502",
      this.facultyName = "Ms. Lopamudra Mohanty",
      this.timeStart = "10:00",
      this.timeEnd = "11:00",
      // this.lectureHall = "LT 60",
      // this.lectureBlock = "KC block",
      this.color = Styles.blueCard,
      this.day = "Monday"
      // required this.onTap
      });

  @override
  State<TeacherCard> createState() => _TeacherCardState();
}

class _TeacherCardState extends State<TeacherCard> {
  @override
  Widget build(BuildContext context) {
    var facultyList = widget.facultyName.split("/");
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        child: Card(
          color: widget.color.withOpacity(0.6),
          // shadowColor: Styles.COLOR1,
          // elevation: 2,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width - 32,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        color: widget.color,
                        width: 74,
                        height: 90,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 6,
                              ),
                              Text(widget.timeStart,
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Styles.timeColor,
                                    height: 0.8,
                                  )),
                              Text("-",
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Styles.timeColor,
                                    height: 0.8,
                                  )),
                              Text(widget.timeEnd,
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Styles.timeColor,
                                    height: 0.8,
                                  ))
                            ])),
                    SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.subjectName,
                          style: GoogleFonts.poppins(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        for (var i = 0; i < facultyList.length; i++)
                          Text(
                            facultyList[i],
                            style: GoogleFonts.poppins(
                                fontSize:
                                    12 - (facultyList.length.toDouble() * 0.5),
                                fontWeight: FontWeight.w500),
                          )
                      ],
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    color: widget.color,
                  ),
                  height: 90,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      children: [
                        Text(widget.day.substring(0, 1).toUpperCase(),
                            style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Styles.textColorMain)),
                        Text(widget.day.substring(1, 2).toUpperCase(),
                            style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Styles.textColorMain)),
                        Text(widget.day.substring(2, 3).toUpperCase(),
                            style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Styles.textColorMain)),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
