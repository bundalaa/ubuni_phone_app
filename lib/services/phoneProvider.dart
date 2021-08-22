import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ubuni_phone_app/constant/constant.dart';
import 'package:ubuni_phone_app/models/phoneModel.dart';

class PhoneProvider with ChangeNotifier {
  PhoneProvider() {
    fetchPhones();
  }
//variables
  List<Phone> _phoneList = [];
 
  bool _isFetchingPhonesData = false;

//getters
  List<Phone> get phoneList => _phoneList;
  bool get isFetchingPhonesData => _isFetchingPhonesData;

//***helpers functions***
  ///fetch all phones
  Future<bool> fetchPhones() async {
    bool hasError = false;
    _isFetchingPhonesData = true;
    notifyListeners();

    List<Phone> _fetchedPhones = [];

    try {
      final response = await http.get(
        Uri.parse(allPhoneApi),
        headers: {
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);

        _fetchedPhones = data.map((e) => Phone.fromJson(e)).toList();

        hasError = false;
      }
    } catch (error) {
      print('---------------------------');
      print(error);
      hasError = true;
    }

    _phoneList = _fetchedPhones;
    _isFetchingPhonesData = false;
    notifyListeners();

    return hasError;
  }

  
}
