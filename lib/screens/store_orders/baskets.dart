import 'package:floivery/components/navigator.dart';
import 'package:floivery/components/top_logo.dart';
import 'package:flutter/material.dart';
import 'components/orders.dart';

class BasketsScreen extends StatelessWidget {
  const BasketsScreen({Key? key}) : super(key: key);

  final List<String> images = const [
    'assets/baskets/big_surprise.png',
    'assets/baskets/bloom.png',
    'assets/baskets/delphinium.png',
    'assets/baskets/feneral.png',
    'assets/baskets/sympathy.png'
  ];

  final List<String> titles = const [
    'Big surprise',
    'Bloom',
    'Delphinium',
    'Feneral',
    'Sympathy'
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
