import 'package:floivery/components/log_out_button.dart';
import 'package:floivery/components/rounded_button_short.dart';
import 'package:floivery/constants.dart';
import 'package:floivery/screens/login/login_screen.dart';
import 'package:floivery/screens/models/user.dart';
import 'package:flutter/material.dart';
import 'package:floivery/screens/signup/components/background.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatefulWidget {
  @override
  BodyState createState() => BodyState();
}

class BodyState extends State<Body> {
  bool _isHidden = true;
  UserData user = new UserData();
  String passwordView = '';
  //const Body({Key? key}) : super(key: key);
  @override
  void initState() {
    super.initState();
    this.getUserData();
  }

  getUserData() async {
    UserData userData = new UserData();
    final prefs = await SharedPreferences.getInstance();
    userData.id = prefs.getInt("id");
    userData.name = prefs.getString("name");
    userData.password = prefs.getString("password");
    userData.phoneNumber = prefs.getString("phoneNumber");
    userData.email = prefs.getString("email");
    setState(() {
      user = userData;
      passwordView = getUserPasswordString();
    });
  }

  getUserPasswordString() {
    String password = '';
    if (_isHidden == true) {
      for (int i = 0; i < user.password.length; i++) {
        password += '*';
      }
    } else if (_isHidden == false) {
      password = user.password;
    }
    return password;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      //child: SingleChildScrollView(
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(top: 15),
                  child: Image.asset(
                    "assets/icons/small_left.png",
                    width: size.width * 0.3,
                    height: size.height * 0.15,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 20, left: 7, right: 7),
                  child: Title(
                    child: const Text('FLOIVERY',
                        style: TextStyle(fontSize: 24.0, color: kPrimaryColor)),
                    color: kBackground,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 15),
                  child: Image.asset(
                    "assets/icons/small_right.png",
                    width: size.width * 0.3,
                    height: size.height * 0.15,
                  ),
                ),
              ],
            ),
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: Image.asset(
                  "assets/icons/avatar.png",
                  width: size.width * 0.3,
                  height: size.width * 0.3,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.05),
            SizedBox(
              width: 300,
              child: Text(
                'Name: ${user.name}',
                style: const TextStyle(
                    fontSize: 20.0,
                    color: kAdditional,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            SizedBox(
              width: 300,
              child: Text(
                'Phone: ${user.phoneNumber}',
                style: const TextStyle(
                    fontSize: 20.0,
                    color: kAdditional,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            SizedBox(
              width: 300,
              child: Text(
                'Email: ${user.email}',
                style: const TextStyle(
                    fontSize: 20.0,
                    color: kAdditional,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            SizedBox(
              width: size.width * 0.6,
              child: RoundedShortButton(
                text: "Change information",
                press: () {},
              ),
            ),
            SizedBox(height: size.height * 0.03),
            SizedBox(
              width: 300,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: size.width * 0.65,
                    child: Text(
                      'Password:' + passwordView,
                      style: const TextStyle(
                          fontSize: 20.0,
                          color: kAdditional,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    child: InkWell(
                      onTap: _togglePasswordView,
                      child: Icon(
                        _isHidden ? Icons.visibility : Icons.visibility_off,
                        color: kAdditional,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.03),
            SizedBox(
              width: size.width * 0.6,
              child: RoundedShortButton(
                text: "Change password",
                press: () {},
              ),
            ),
            SizedBox(height: size.height * 0.03),
            SizedBox(
              width: size.width * 0.6,
              child: LogOutButton(
                text: "Log out",
                press: () {
                  //session.closeSession();
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
            ),
          ],
        ),
      ),
      //),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
      passwordView = getUserPasswordString();
    });
  }
}
