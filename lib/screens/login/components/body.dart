import 'dart:convert';
import 'package:floivery/constants.dart';
import 'package:floivery/screens/models/user.dart';
import 'package:floivery/screens/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:floivery/screens/signup/components/background.dart';
import 'package:floivery/components/rounded_button.dart';
import 'package:flutter/services.dart';
import 'package:mask_input_formatter/mask_input_formatter.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin UserValidation {

  bool userCredsAreValid (LoginData creds, List<User> users) {
    List<User> usersList =
    users.where((element) =>
    element.phoneNumber == creds.phoneNumber && element.password == creds.password).toList();
    if (usersList.isEmpty) {
        return false;
      }

    return true;
  }

  bool phoneIsValid (String? phoneNumber, List<User> users) {
     List<User> usersList =
          users.where((element) =>
          element.phoneNumber == phoneNumber).toList();

     if (usersList.isEmpty) {
       return false;
     }
     return true;
  }

  bool passwordIsValid (String? password, String? phoneNumber, List<User> users) {
    List<User> usersList =
    users.where((element) =>
    element.phoneNumber == phoneNumber).toList();

    if (usersList[0].password != password) {
      return false;
    }
    return true;
  }
}

class Body extends StatefulWidget {
  @override
  BodyState createState() => BodyState();
}

class BodyState extends State<Body> with UserValidation {
  LoginData creds = new LoginData();
  final _formKey = GlobalKey<FormState>();
  bool _isHidden = true;
  List<User> users = [];
  String res = '';
  SharedPreferences? preferences;
  //const Body({Key? key}) : super(key: key);
  @override
  void initState() {
    super.initState();
    this.readJson();
  }

  Future<void> setUserSession (User user) async{
    preferences  = await SharedPreferences.getInstance();
    await preferences!.setInt('id', user.id);
    await preferences!.setString('name', user.name);
    await preferences!.setString('phoneNumber', user.phoneNumber);
    await preferences!.setString('password', user.password);
    await preferences!.setString('email', user.email);
  }

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = jsonDecode(response)["users"].cast<Map<String, dynamic>>();
    setState(() {
      users = data.map<User>((json) => User.fromJson(json)).toList();
    });
  }

  User getCurrentUser(String phoneNumber) {
    List<User> usersList =
    users.where((element) =>
    element.phoneNumber == phoneNumber).toList();

    return usersList[0];
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
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
              SizedBox(height: size.height * 0.07),
              SizedBox(
                width: 300,
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Phone Number'),
                  inputFormatters: [
                    MaskInputFormatter(mask: '(###)###-##-##'),
                  ],
                  validator: (phoneNumber) {
                    if (!phoneIsValid(phoneNumber, users)) {
                      return 'Phone Number is incorrect';
                    }
                    else if (phoneNumber == null) {
                      return 'Phone number is required';
                    }
                    else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    creds.phoneNumber = value;
                  },
                ),
              ),
              SizedBox(height: size.height * 0.03),
              SizedBox(
                width: 300,
                child: TextFormField(
                    obscureText: _isHidden,
                    decoration: InputDecoration(
                        labelText: 'Password',
                        suffix: InkWell(
                          onTap: _togglePasswordView,
                          child: Icon(
                            _isHidden
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: kPrimaryColor,
                          ),
                        ),
                    ),
                    validator: (password) {
                      if (password == null) {
                        return 'Password number is required';
                      }
                      else if (phoneIsValid(creds.phoneNumber, users)) {
                        if (!passwordIsValid(password, creds.phoneNumber, users)) {
                          return 'Password is incorrect';
                        }
                      }
                      else {
                        return null;
                      }
                    },
                    onChanged: (value) {
                      creds.password = value;
                    },
                  ),
              ),
              SizedBox(height: size.height * 0.06),
              SizedBox(
                width: 300,
                child: RoundedButton(
                text: "Log in",
                press: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                  }
                  if (userCredsAreValid(creds, users)) {
                    setUserSession(getCurrentUser(creds.phoneNumber)).whenComplete((){
                      setState(() {});
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ProfileScreen();
                          },
                        ),
                      );
                    });
                  }
                },
                ),
              ),
              SizedBox(height: size.height * 0.01),
            ],
           ),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}