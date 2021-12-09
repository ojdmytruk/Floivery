import 'package:flutter/material.dart';
import 'package:floivery/screens/signup/components/body.dart';


class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  // @override
  // State<StatefulWidget> createState() => Body();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}