import 'package:floivery/components/navigator.dart';
import 'package:floivery/components/top_logo.dart';
import 'package:flutter/material.dart';
import 'components/bouquets.dart';

class BouquetsScreen extends StatelessWidget {
  const BouquetsScreen({Key? key}) : super(key: key);

  final List<String> images = const [
    'assets/bouquets/bouqouet.png',
    'assets/bouquets/busket.png',
    'assets/bouquets/chrizantema.png',
    'assets/bouquets/darina.png',
    'assets/bouquets/pink1.png',
    'assets/bouquets/pink-basket.png',
    'assets/bouquets/rose_rose.png'
  ];

  final List<String> titles = const [
    'Rose bouquet',
    'Mix basket',
    'Purple chrysanthemums',
    'Mix bouquet',
    'Pink bouquet',
    'Pink basket',
    'Roses pink basket'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const BottomNavigator(),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const TopLogo(),
            for (int i = 0; i < 7; i++) BouqetWidget(
              image: images[i],
              title: titles[i],
            ),
          ]),
        ));
  }
}
