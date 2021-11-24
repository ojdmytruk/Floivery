import 'package:flutter/material.dart';
import 'package:floivery/screens/registration/registration_screen.dart';
import 'package:floivery/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Floivery',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBackground,
      ),
      home: RegistrationScreen(),
    );
  }
}
