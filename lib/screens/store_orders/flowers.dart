import 'package:floivery/components/navigator.dart';
import 'package:floivery/components/top_logo.dart';
import 'package:flutter/material.dart';
import 'components/orders.dart';

class FlowersScreen extends StatelessWidget {
  const FlowersScreen({Key? key}) : super(key: key);

  final List<String> images = const [
    'assets/flowers/calla.png',
    'assets/flowers/chamomile.png',
    'assets/flowers/pink_rose.png',
    'assets/flowers/red_rose.png',
    'assets/flowers/tulip.png'
  ];

  final List<String> titles = const [
    'Calla',
    'Chamomile',
    'Pink rose',
    'Red rose',
    'Red tulips'
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
