import 'package:floivery/components/navigator.dart';
import 'package:floivery/components/top_logo.dart';
import 'package:flutter/material.dart';
import 'components/orders.dart';

class BouquetsScreen extends StatelessWidget {
  const BouquetsScreen({Key? key}) : super(key: key);

  final List<String> images = const [
    'assets/bouquets/bunch_of_roses.png',
    'assets/bouquets/cream_roses.png',
    'assets/bouquets/dried.png',
    'assets/bouquets/pink_mix.png',
    'assets/bouquets/rose_sunflover.png'
  ];

  final List<String> titles = const [
    'Bunch of roses',
    'Cream roses',
    'Dried flowers',
    'Pink mix',
    'Sunflowers'
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
