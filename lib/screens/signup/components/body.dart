import 'package:floivery/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:floivery/screens/signup/components/background.dart';
import 'package:floivery/components/rounded_button.dart';
import 'package:floivery/components/input_field.dart';
import 'package:floivery/components/password_field.dart';
import 'package:flutter/painting.dart';
import 'dart:convert';
import 'dart:io';
import 'package:floivery/screens/models/user.dart';
import 'package:mask_input_formatter/mask_input_formatter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

mixin InputValidation {


  bool passwordIsValid (String? password, User user) {

    if (user.password != password) {
      return false;
    }
    return true;
  }
}

class Body extends StatefulWidget {

  @override
  BodyState createState() => BodyState();
}

class BodyState extends State<Body> with InputValidation{

  User user = User(
    id:'',
    email: '',
    name: '',
    password: '',
    phoneNumber: ''
  );

  @override
  void initState() {
    super.initState();
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<void> setUser(User user) async {
    final json = jsonEncode(user.toJson());
    final path = await _localPath;
    // final String path = await rootBundle.loadString('assets/data.json');
    File jsonFile = File ('$path/users.json');
    print(json);
    print(path);
    jsonFile.writeAsStringSync(json);
  }


  Widget buildName() => InputField(
    inputFormaters: [],
    // controller: _textName,
    labelText: "Name",
    hintText: "Ivan Ivanov",
    onChanged: (value) => setState(() => user = user.copy(name: value)),
  );

  Widget buildPhone() => InputField(
    inputFormaters: [MaskInputFormatter(mask: '(###)###-##-##'),],
    labelText: "Phone Number",
    hintText: '(###)###-##-##',
    onChanged: (value) => setState(() => user = user.copy(phoneNumber: value)),
  );

  Widget buildEmail() => InputField(
    inputFormaters: [],
    // controller: _textEmail,
    labelText: "Email",
    hintText: "example_mail@gmail.com",
    onChanged: (value) => setState(() => user = user.copy(email: value)),
  );

  Widget buildPassword() => PasswordField(
    val: (value) {
      if (value == null) return "Enter the Password";
    },
    // controller: _textPassword,
    labelText: "Password",
    hintText: "",
    onChanged: (value) => setState(() => user = user.copy(password: value)),
  );

  Widget buildConfirmPassword() => PasswordField(
    // controller: controller,
    val: (value) {
      if (!passwordIsValid(value, user)) {
        return 'Does not match password';
      }
      else if (value == null) {
        return 'Confirmation is required';
      }
      else {
        return null;
      }
    },
    onChanged: (value){},
    hintText: '',
    labelText: 'Confirm Password',
  );

  Widget buildButton(BuildContext context) => RoundedButton(
    text: "Sign Up",
    press: () async {
      setState(() => user = user.copy(id: Uuid().v4()));
      // await UserPreferences.addUsers(user);
      await setUser(user);


      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) {
          return LoginScreen();
        },
      ));
      // final isNewUser = widget.id == null;
      //
      // if (isNewUser) {
      //   await UserPreferences.addUsers(user!);
      //   await UserPreferences.setUser(user!);
      //
      //   Navigator.of(context).pushReplacement(MaterialPageRoute(
      //     builder: (context) {
      //       return const MainPage();
      //     },
      //   ));
      // } else {
      //   await UserPreferences.setUser(user!);
      // }
    // {
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) {
      //       return MainPage();
      //     },
      //   ),
      // );
      // if(_formKey.currentState!.validate()) {
      //   ScaffoldMessenger.of(context).showSnackBar(
      //       const SnackBar(
      //         content: Text('Registration completed'),
      //         backgroundColor: Colors.green,
      //       )
      //   );
      // }
    },
  );

  @override
  Widget build(BuildContext context) {
    // String tempPass = "";

    Size size = MediaQuery
        .of(context)
        .size;
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
            buildName(),
            SizedBox(height: size.height * 0.01),
            buildPhone(),
            SizedBox(height: size.height * 0.01),
            buildEmail(),
            SizedBox(height: size.height * 0.01),
            buildPassword(),
            SizedBox(height: size.height * 0.01),
            buildConfirmPassword(),
            SizedBox(height: size.height * 0.01),
            buildButton(context),
            // Positioned(
            //   top: size.height * 0.15,
            //   left: size.width * 0.25,
            //   child: Image.asset(
            //     "assets/icons/logo_floivery.png",
            //     width: size.width * 0.5,
            //     height: size.height * 0.25,
            //   ),
            // ),
            // SizedBox(height: size.height * 0.01),
            // InputField(
            //   val: (value) {
            //     if (value!.isEmpty) return "Enter the Name";
            //   },
            //   // controller: _textName,
            //   labelText: "Name",
            //   hintText: "Ivan",
            //   onChanged: (value) {},
            // ),
            //
            // SizedBox(height: size.height * 0.01),
            // InputField(
            //   val: (value) {
            //     if (value!.isEmpty) return "Enter the Phone Number";
            //   },
            //   // controller: _textPhoneNumber,
            //   labelText: "Phone Number",
            //   hintText: "+38(0xx)-xx-xxx-xx",
            //   onChanged: (value) {},
            // ),
            // SizedBox(height: size.height * 0.01),
            // InputField(
            //   val: (value) {
            //     if (value!.isEmpty) return "Enter the Email";
            //     String p = "[a-zA-Z0-9+._%-+]{1,256}@[a-zA-Z0-9][a-zA-Z0-9-]{0,64}(.[a-zA-Z0-9][a-zA-Z0-9-]{0,25})+";
            //     RegExp regExp = RegExp(p);
            //     if (regExp.hasMatch(value)) return null;
            //     return 'Enter correct email';
            //   },
            //   // controller: _textEmail,
            //   labelText: "Email",
            //   hintText: "example_mail@gmail.com",
            //   onChanged: (value) {},
            // ),
            // SizedBox(height: size.height * 0.01),
            // PasswordField(
            //   val: (value) {
            //     if (value!.isEmpty) return "Enter the Password";
            //   },
            //   // controller: _textPassword,
            //   labelText: "Password",
            //   hintText: "",
            //   onChanged: (value) {
            //     var s = value;
            //     tempPass = s;
            //   },
            // ),
            // SizedBox(height: size.height * 0.01),
            // PasswordField(
            //   val: (value) {
            //     // if (value!.isEmpty) return "Enter the Password";
            //     if (tempPass == value) return null;
            //     return "Does not match password";
            //   },
            //   // controller: _textPasswordConf,
            //   labelText: "Confirm Password",
            //   hintText: "",
            //   onChanged: (value) {},
            // ),
            // SizedBox(height: size.height * 0.01),
            // RoundedButton(
            //   text: "Sign Up",
            //   press: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) {
            //           return MainPage();
            //         },
            //       ),
            //     );
            //     if(_formKey.currentState!.validate()) {
            //       ScaffoldMessenger.of(context).showSnackBar(
            //           const SnackBar(
            //             content: Text('Registration completed'),
            //             backgroundColor: Colors.green,
            //           )
            //       );
            //     }
            //   },
            // ),
            // SizedBox(height: size.height * 0.01),
          ],
        ),
      ),
    );
  }
  // @override
  // void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  //   super.debugFillProperties(properties);
  //   properties.add(DiagnosticsProperty<SharedPreferences>('_preferences', _preferences));
  // }

}