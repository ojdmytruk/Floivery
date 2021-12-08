import 'package:floivery/components/navigator.dart';
import 'package:floivery/components/top_logo.dart';
import 'package:flutter/material.dart';
import 'components/orders.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  final List<String> images = const [
    'assets/store_orders/bouqouet.png',
    'assets/store_orders/busket.png',
    'assets/store_orders/chrizantema.png',
    'assets/store_orders/darina.png',
    'assets/store_orders/pink1.png',
    'assets/store_orders/pink-basket.png',
    'assets/store_orders/rose_rose.png'
  ];

  final List<String> titles = const [
    'Rose store_orders',
    'Mix basket',
    'Purple chrysanthemums',
    'Mix store_orders',
    'Pink store_orders',
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
            for (int i = 0; i < 7; i++) OrderWidget(
              image: images[i],
              title: titles[i],
            ),
          ]),
        ));
  }
}
