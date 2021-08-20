import 'package:flutter/material.dart';
import 'package:ubuni_phone_app/constant/constant.dart';
import 'package:ubuni_phone_app/screens/splashScreen.dart';
import 'package:ubuni_phone_app/theme.dart';
import 'package:ubuni_phone_app/views/FirstView.dart';
import 'package:ubuni_phone_app/views/homeView.dart';
import 'package:ubuni_phone_app/views/secondView.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: appName,
      theme: lightThemeData(context),
      home: SplashScreen(),
      routes: {
        homeView: (_) => const HomeView(),
        firstView: (_) => const FirstView(),
        secondView: (_) => const SecondView()
        }
    );
  }
}