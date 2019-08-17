import 'package:event_attendance/signUp/signUpPage.dart';
import 'package:flutter/material.dart';

import 'eventAtendee/eventAtendee.dart';
import 'landing/landingPage.dart';
import 'login/loginPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
      },
    );
  }
}

