import 'package:floivery/components/navigator.dart';
import 'package:floivery/components/top_logo.dart';
import 'package:flutter/material.dart';
import 'components/store.dart';

class StoresScreen extends StatelessWidget {
  const StoresScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const BottomNavigator(),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const TopLogo(),
            for (int i = 0; i < 15; i++) const StoreWidget(),
          ]),
        ));
  }
}
