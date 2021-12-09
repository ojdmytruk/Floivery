import 'package:flutter/material.dart';
import 'package:floivery/screens/login/login_screen.dart';
import 'package:floivery/screens/signup/signup_screen.dart';
import 'package:floivery/screens/main_page/components/background.dart';
import 'package:floivery/components/rounded_button.dart';
import 'package:floivery/components/rounded_logo_button.dart';
import 'package:floivery/constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.5),

          ],
        ),
      ),
    );
  }
}