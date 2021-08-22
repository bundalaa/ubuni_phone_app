import 'package:flutter/material.dart';

class Phone {
  final int id;
  final String name;
  // ignore: non_constant_identifier_names
  final String Brand;
  // ignore: non_constant_identifier_names
  final String image_url;

  // ignore: non_constant_identifier_names
  Phone({@required this.id, @required this.name, @required this.Brand, @required this.image_url});

  factory Phone.fromJson(Map<String, dynamic> json) {
    return Phone(
      id: json['id'] as int,
      name: json['name'] as String,
      Brand: json['Brand'] as String,
      image_url: json['image_url'] as String,
    );
  }
}
