import 'package:floivery/screens/login/components/body.dart';
import 'package:floivery/screens/models/user.dart';
import 'package:flutter/material.dart';
import 'package:floivery/screens/signup/components/background.dart';
import 'package:floivery/components/rounded_button.dart';
import 'package:floivery/components/input_field.dart';
import 'package:floivery/components/password_field.dart';
import 'package:flutter/painting.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);
  @override
  BodyState createState() => BodyState();
}

class BodyState extends State<Body> {

  UserData user = new UserData();
  UserSession session = new UserSession();

  @override
  void initState() {
    super.initState();
    this.getUserData();
  }

  getUserData() async{
    UserData userData = new UserData();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userData.id = prefs.getInt("id");
    userData.password = prefs.getString("password");
    userData.phoneNumber = prefs.getString("phoneNumber");
    userData.email = prefs.getString("email");
    setState(() {
      user = userData;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //write here your logic instead of these check inputs
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
              inputFormaters: [],
              labelText: "id",
              hintText: user.id.toString(),
              onChanged: (value) {},
            ),
            SizedBox(height: size.height * 0.01),
            InputField(
              inputFormaters: [],
              labelText: "email",
              hintText: user.email,
              onChanged: (value) {},
            ),
            SizedBox(height: size.height * 0.01),
            InputField(
              inputFormaters: [],
              labelText: "Phone Number",
              hintText: user.phoneNumber,
              onChanged: (value) {},
            ),
            SizedBox(height: size.height * 0.01),
            PasswordField(
              val: (value){},
              labelText: "Password",
              hintText: user.password,
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