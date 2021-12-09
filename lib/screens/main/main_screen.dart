import 'package:floivery/components/navigator.dart';
import 'package:floivery/screens/main/components/body.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: BottomNavigator(),
      body: BodyOfMain(),
    );
  }
}
