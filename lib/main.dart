import 'package:floivery/screens/main/main_screen.dart';
import 'package:floivery/screens/profile/profile.dart';
import 'package:floivery/screens/stores/stores_screen.dart';
import 'package:flutter/material.dart';
import 'package:floivery/screens/registration/registration_screen.dart';
import 'package:floivery/constants.dart';
import 'package:floivery/screens/bouquet/bouquets_screen.dart';

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
        initialRoute: 'registration-screen',
        // home: RegistrationScreen(),
        routes: {
          'registration-screen': (context) => const RegistrationScreen(),
          'main-screen': (context) => const MainScreen(),
          'store-scrern': (context) => const StoresScreen(),
          'profile-screen': (context) => const ProfileScreen(),
          'bouquet-screen': (context) => const BouquetsScreen(),
          // 'search-screen': (context) => (),
          // 'profile-screen': (context) => (),
          // '/profile': (context) => Profile(),
        });
  }
}
