import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ubuni_phone_app/constant/constant.dart';
import 'package:ubuni_phone_app/services/phoneProvider.dart';
import 'package:ubuni_phone_app/views/secondView.dart';

class FirstView extends StatelessWidget {
  const FirstView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _phoneProvider = Provider.of<PhoneProvider>(context);
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
          backgroundColor: const Color(0xFFFFFFFF),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
              size: 18,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Container(
            height: 30,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: TextField(
                  style: Theme.of(context).textTheme.bodyText1,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding:
                        EdgeInsets.only(left: 15, bottom: 5, top: 5, right: 15),
                    hintText: 'Search brand phone here...',
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: Color(0xFFBBBBBB),
                    ),
                  )),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(
                Icons.shopping_cart,
                color: Colors.black,
                size: 20,
              ),
            )
          ]),
      body: Container(
         child: _phoneProvider.isFetchingPhonesData
            ? const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    primaryColor,
                  ),
                ),
              )
            : _phoneProvider.phoneList.isEmpty
                ? const Center(
                    child: Text('No Phones'),
                  )
                :  GridView.builder(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
               crossAxisCount: 2,                    
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5
              ),
          itemCount: _phoneProvider.phoneList.length,
          itemBuilder: (BuildContext ctx, index) {
            return InkWell(
              onTap: () async {
            await showDialog(
              context: context,
              builder: (_) => SecondView(id: _phoneProvider.phoneList[index].id         
              )
            );
          },
              child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                    10,
                   
                  ),
                  // color: Colors.red
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 70,
                        child: Image.network(
                            _phoneProvider.phoneList[index].image_url),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Row(
                          children: [
                            Text(
                              'name: ',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            Text(
                              _phoneProvider.phoneList[index].name,
                              style: Theme.of(context).textTheme.bodyText2,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Row(
                          children: [
                            Text(
                              'Brand: ',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            Text(
                              _phoneProvider.phoneList[index].Brand,
                              style: Theme.of(context).textTheme.bodyText2,
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
            );
          }),
      )
    );
  }
}
