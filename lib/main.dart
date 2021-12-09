import 'package:floivery/screens/main/main_screen.dart';
import 'package:floivery/screens/profile/profile.dart';
import 'package:floivery/screens/stores/stores_screen.dart';
import 'package:floivery/search/search_screen.dart';
import 'package:floivery/search/search_screen_item.dart';
import 'package:floivery/search/search_screen_shops.dart';
import 'package:flutter/material.dart';
import 'package:floivery/screens/registration/registration_screen.dart';
import 'package:floivery/constants.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Floivery',
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: kBackground,
        ),
        initialRoute: 'search-shops-screen',
        //'search-cities-screen',
        // 'search-items-screen',
        routes: {
          'registration-screen': (context) => const RegistrationScreen(),
          'main-screen': (context) => const MainScreen(),
          'store-scrern': (context) => const StoresScreen(),
          'profile-screen': (context) => const ProfileScreen(),
          'search-cities-screen': (context) => const SearchScreen(),
          'search-shops-screen': (context) => const SearchStoresScreen(),
          'search-items-screen': (context) => const SearchItemScreen()
          // 'profile-screen': (context) => (),
          // '/profile': (context) => Profile(),
        });
  }
}
