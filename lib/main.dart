import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ubuni_phone_app/app.dart';
import 'package:ubuni_phone_app/services/phoneProvider.dart';

void main() {
  runApp(MultiProvider(
     providers: [
          ChangeNotifierProvider(create: (_) => PhoneProvider()),
         ],
    child: MyApp()));
}



