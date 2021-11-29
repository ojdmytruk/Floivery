import 'package:flutter/material.dart';
import 'package:floivery/screens/signup/components/background.dart';
import 'package:floivery/components/rounded_button.dart';
import 'package:floivery/components/input_field.dart';
import 'package:floivery/components/password_field.dart';
import 'package:flutter/painting.dart';

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
            Positioned(
              top: size.height * 0.15,
              left: size.width * 0.25,
              child: Image.asset(
                "assets/icons/logo_floivery.png",
                width: size.width * 0.5,
                height: size.height * 0.25,
              ),
            ),
            SizedBox(height: size.height * 0.01),
            InputField(
              labelText: "Name",
              hintText: "Ivan",
              onChanged: (value) {},
            ),

            SizedBox(height: size.height * 0.01),
            InputField(
              labelText: "Phone Number",
              hintText: "+38(0xx)-xx-xxx-xx",
              onChanged: (value) {},
            ),
            SizedBox(height: size.height * 0.01),
            InputField(
              labelText: "Email",
              hintText: "example_mail@gmail.com",
              onChanged: (value) {},
            ),
            SizedBox(height: size.height * 0.01),
            PasswordField(
              labelText: "Password",
              hintText: "",
              onChanged: (value) {},
            ),
            SizedBox(height: size.height * 0.01),
            PasswordField(
              labelText: "Confirm Password",
              hintText: "",
              onChanged: (value) {},
            ),
            SizedBox(height: size.height * 0.01),
            RoundedButton(
              text: "Sign Up",
              press: () {},
            ),
            SizedBox(height: size.height * 0.01),
          ],
        ),
      ),
    );
  }
}