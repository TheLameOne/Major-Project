import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soochi_admin/utils/global.dart';

class Schedules extends StatefulWidget {
  const Schedules({super.key});

  @override
  State<Schedules> createState() => _SchedulesState();
}

_downloadFile(String dowloadLink) async {
  final taskId = await FlutterDownloader.enqueue(
    url: dowloadLink,
    savedDir: '/',
    showNotification: true,
    openFileFromNotification: true,
  );
}

class _SchedulesState extends State<Schedules> {
  final fireStore =
      FirebaseFirestore.instance.collection("timetable").snapshots();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text("Schedules",
                      style: GoogleFonts.poppins(
                          fontSize: 26, fontWeight: FontWeight.w600)),
                ),
                SizedBox(height: 32),
                StreamBuilder<QuerySnapshot>(
                  stream: fireStore,
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.hasData) {
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            for (int i = 0; i < snapshot.data!.size; i++)
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    _downloadFile(
                                        snapshot.data!.docs[i]["url"]);
                                    successToast("Downloading File", context);
                                  },
                                  child: Container(
                                      height: 50,
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.amber),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                          child: Text(snapshot
                                              .data!.docs[i]["name"]
                                              .toString()),
                                        ),
                                      )),
                                ),
                              )
                          ],
                        ),
                      );
                    } else if (snapshot.hasError) {
                      print(snapshot.error.toString());
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else {
                      print("Something went Wrong");
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                )
                // AttendanceCard(
                //   onTap: () {},
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
