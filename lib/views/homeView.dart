import 'package:flutter/material.dart';
import 'package:ubuni_phone_app/constant/constant.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Wrap(
          direction: Axis.vertical,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Icon(Icons.phone_iphone, size: 200, color: primaryColor),
            Text('Mobile Shop',
                style: Theme.of(context).textTheme.headline6.copyWith(
                      color: const Color(0xFF000000),
                      fontWeight: FontWeight.bold,
                    )),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: primaryColor,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(firstView);
                },
                child: Text('view phone collections'))
          ],
        ),
      ),
    );
  }
}
