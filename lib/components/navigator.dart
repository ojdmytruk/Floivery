import 'package:floivery/constants.dart';
import 'package:floivery/screens/main/main_screen.dart';
import 'package:floivery/screens/profile/profile.dart';
import 'package:floivery/screens/store_orders/order_screen.dart';
// import 'package:floivery/screens/main/main_screen.dart';
import 'package:floivery/screens/stores/stores_screen.dart';
import 'package:floivery/search/search_screen_stores.dart';

import 'package:flutter/material.dart';

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({Key? key}) : super(key: key);

  static int pageId = 0;
  static void changeId(int index) {
    pageId = index;
  }

  @override
  AppNavigator createState() => AppNavigator();
}

class AppNavigator extends State<BottomNavigator> {
  void _onItemTapped(int index) {
    BottomNavigator.changeId(index);
    setState(() {
      switch (index) {
        case 0:
          {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MainScreen()));
          }
          break;
        case 1:
          {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SearchStoresScreen()));
          }
          break;

        case 2:
          {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const OrderScreen()));
          }
          break;
        case 3:
          {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()));
          }
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.08,
      child: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Main',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: BottomNavigator.pageId,
        selectedItemColor: kAdditional,
        unselectedItemColor: kPrimaryColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: _onItemTapped,
      ),
    );
  }
}
