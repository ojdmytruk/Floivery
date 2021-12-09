import 'package:flutter/material.dart';
import 'package:floivery/screens/login/login_screen.dart';
import 'package:floivery/screens/signup/signup_screen.dart';
import 'package:floivery/screens/registration/components/background.dart';
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
            RoundedLogoButton(
              imagePath: "assets/icons/logo_google.png",
              text: "Continue with Google",
              color: kBackground,
              textColor: kAdditional,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
            RoundedLogoButton(
              imagePath: "assets/icons/logo_fb.png",
              text: "Continue with Facebook",
              color: kBackground,
              textColor: kAdditional,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const SignUpScreen();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "Sign Up",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "Log in",
              color: kBackground,
              textColor: kAdditional,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}