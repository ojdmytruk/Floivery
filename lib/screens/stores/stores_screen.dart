import 'package:floivery/components/navigator.dart';
import 'package:floivery/screens/home/components/body.dart';
import 'package:flutter/material.dart';
import 'components/store.dart';

class StoresScreen extends StatelessWidget {
  const StoresScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
