import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ubuni_phone_app/constant/constant.dart';
import 'package:ubuni_phone_app/views/homeView.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
    @override  
  void initState() {  
    super.initState();  
    Timer(Duration(seconds: 5),  
            ()=>Navigator.pushReplacement(context,  
            MaterialPageRoute(builder:  
                (context) => HomeView()  
            )  
         )  
    );  
  }  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Icon(Icons.phone_iphone,
      size: 200,
      color: primaryColor,
      ),),
    );
  }
}