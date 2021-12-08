import 'package:floivery/components/navigator.dart';
import 'package:floivery/components/top_logo.dart';
import 'package:flutter/material.dart';
import 'components/orders.dart';

class BoxesScreen extends StatelessWidget {
  const BoxesScreen({Key? key}) : super(key: key);

  final List<String> images = const [
    'assets/boxes/minimalistic.png',
    'assets/boxes/purple.png',
    'assets/boxes/red_roses.png',
    'assets/boxes/vintage.png',
    'assets/boxes/white_roses.png'
  ];

  final List<String> titles = const [
    'Minimalistic',
    'Purple mood',
    'Red roses',
    'Vintage',
    'White roses'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const BottomNavigator(),
        body: SingleChildScrollView(
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const TopLogo(),
            for (int i = 0; i < 5; i++) OrderWidget(
              image: images[i],
              title: titles[i],
            ),
          ]),
        ));
  }
}
