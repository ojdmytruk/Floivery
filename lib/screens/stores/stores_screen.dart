import 'package:floivery/components/navigator.dart';
import 'package:floivery/screens/home/components/body.dart';
import 'package:flutter/material.dart';
import 'components/store.dart';

class StoresScreen extends StatelessWidget {
  const StoresScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var store_screen_height = MediaQuery.of(context).size.height * 0.92;
    var store_screen_width = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: const BottomNavigator(),
      body: ListView(
        children: List.generate(
          100,
          (index) => const StoreWidget(),
        ),
      ),
    );
  }
}
