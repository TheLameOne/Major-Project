import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/global.dart';
import '../SplashPage.dart';

class AddConstraints extends StatefulWidget {
  static const String routeNamed = 'AddConstraints';

  @override
  State<AddConstraints> createState() => _AddConstraintsState();
}

class _AddConstraintsState extends State<AddConstraints> {
  var _loader = false;
  void _uploadToFirebase() async {
    setState(() {
      _loader = true;
    });

    var storage = FirebaseStorage.instance;
    List<String> listOfJson = [
      'json/Generated_CE.json',
      'json/Generated_CEIT.json',
      'json/Generated_CS.json'
    ];
    listOfJson.forEach((file) async {
      String fileName =
          file.substring(file.lastIndexOf("_") + 1, file.lastIndexOf("."));
      String path = 'timetable';
      final Directory systemTempDir = Directory.systemTemp;
      final byteData = await rootBundle.load(file);
      final tempFile = File('${systemTempDir.path}/$fileName.json');
      await tempFile.writeAsBytes(byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
      TaskSnapshot taskSnapshot =
          await storage.ref('$path/$fileName').putFile(tempFile);
      final String downloadUrl = await taskSnapshot.ref.getDownloadURL();
      await FirebaseFirestore.instance.collection(path).add({
        "url": downloadUrl,
        "name": "[${fileName}]" + DateTime.now().toString()
      });

      setState(() {
        _loader = false;
      });
    });
    // await
  }

  Map<String, dynamic> constraints = {
    "Population Size": 100.0,
    "Elite Size": 20.0,
    "Mutation Rate": 0.1,
    "Number of Generations": 100.0,
  };
  var maxRange = [1000.0, 100.0, 0.5, 1000.0];
  var initialValues = [100.0, 20.0, 0.1, 100.0];
  @override
  Widget build(BuildContext context) {
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
          "Add Constraints",
          style: GoogleFonts.poppins(
              fontSize: 22, fontWeight: FontWeight.w500, color: Colors.black),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              SizedBox(height: 16),
              for (int i = 0; i < constraints.length; i++)
                Column(
                  children: [
                    Text(
                      "${constraints.entries.toList()[i].key} : (${initialValues[i]})",
                      style: GoogleFonts.poppins(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    Slider(
                      value: initialValues[i],
                      max: maxRange[i],
                      divisions: 10,
                      label: initialValues[i].toString(),
                      onChanged: (value) {
                        setState(() {
                          initialValues[i] = value;
                          print(initialValues[i]);
                        });
                      },
                    )
                  ],
                )
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 32),
            child: InkWell(
              onTap: () {
                successToast("Generating TimeTable", context);
                _uploadToFirebase();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => SplashPage()),
                    (Route<dynamic> route) => false);
              },
              child: Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    "Generate TimeTable",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
