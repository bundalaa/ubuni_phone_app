import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ubuni_phone_app/constant/constant.dart';
import 'package:ubuni_phone_app/models/phoneModel.dart';

class SecondView extends StatefulWidget {
  final int id;
  const SecondView({@required this.id, Key key}) : super(key: key);

  @override
  _SecondViewState createState() => _SecondViewState();
}

class _SecondViewState extends State<SecondView> {
  ///variables///
  Future<Phone> futurePhone;

////get single phone////
  Future<Phone> getPhone() async {
    final response = await http
        .get(Uri.parse('https://www.paa.ubuni.co.tz/phones/${widget.id}'));

    if (response.statusCode == 200) {
      return Phone.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load phone');
    }
  }

////initial state////
  @override
  void initState() {
    super.initState();
    futurePhone = getPhone();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Center(
        child: FutureBuilder<Phone>(
          future: futurePhone,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 40, top: 15, bottom: 5),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            snapshot.data.Brand,
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10,bottom: 10),
                          child: Text(
                            snapshot.data.name,
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  Image.network(snapshot.data.image_url),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: RaisedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Ok',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: primaryColor),
                            ))),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                primaryColor,
              ),
            );
          },
        ),
      ),
    );
  }
}
