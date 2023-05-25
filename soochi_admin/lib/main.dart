import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soochi_admin/presentation/SplashPage.dart';
import 'package:soochi_admin/presentation/TabPages/Home.dart';
import 'package:soochi_admin/presentation/TabPages/Profile.dart';
import 'package:soochi_admin/presentation/auth/login_screen.dart';
import 'package:soochi_admin/presentation/auth/registration_screen.dart';
import 'package:soochi_admin/presentation/screens/add_classes.dart';
import 'package:soochi_admin/presentation/screens/add_constraints.dart';
import 'package:soochi_admin/presentation/screens/periods_availability.dart';
import 'package:soochi_admin/presentation/screens/teacher_availability.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(debug: true, ignoreSsl: true);
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Soochi',
        // theme: ThemeData(
        //     primarySwatch: Colors.blueGrey,
        //     textTheme: GoogleFonts.latoTextTheme()),
        initialRoute: SplashPage.routeNamed,
        routes: {
          SplashPage.routeNamed: (BuildContext context) => SplashPage(),
          RegistrationScreen.routeNamed: (BuildContext context) =>
              RegistrationScreen(),
          LoginScreen.routeNamed: (BuildContext context) => LoginScreen(),
          Home.routeNamed: (BuildContext context) => Home(),
          Profile.routeNamed: (BuildContext context) => Profile(),
          AddClasses.routeNamed: (BuildContext context) => AddClasses(),
          PeriodsAvailability.routeNamed: (BuildContext context) =>
              PeriodsAvailability(),
          TeacherAvailability.routeNamed: (BuildContext context) =>
              TeacherAvailability(),
          AddConstraints.routeNamed: (BuildContext context) => AddConstraints()
        });
  }
}
