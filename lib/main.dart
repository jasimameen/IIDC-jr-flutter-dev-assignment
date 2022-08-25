import 'package:flutter/material.dart';
import 'package:iide_flutter_test/core/helpers.dart';
import 'package:iide_flutter_test/screens/screen_home.dart';

import 'screens/screen_cart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      title: 'IIDE Product Cart',
      theme: ThemeData(
        //
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const ScreenHome(),
        '/cart': (context) => const ScreenCart(),
      },
    );
  }
}
