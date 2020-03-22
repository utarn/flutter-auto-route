import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../routes/router.gr.dart';

class InitialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text('Go to SECOND'),
              onPressed: () => navigateToSecond(context),
            ),
            SizedBox(height: 10),
            RaisedButton(
              child: Text('Go to THIRD'),
              onPressed: () => navigateToThird(context),
            ),
            RaisedButton(
              child: Text('Add token'),
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setString('token_key', '111');
              },
            ),
            RaisedButton(
              child: Text('Remove token'),
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.remove('token_key');
              },
            )
          ],
        ),
      ),
    );
  }

  void navigateToSecond(BuildContext context) {
    // ExtendedNavigator.of(context).pushSecondPage(userId: '111');
    ExtendedNavigator.of(context)
        .pushNamed(Routes.secondPage, arguments: '1112');
  }

  void navigateToThird(BuildContext context) {
    ExtendedNavigator.ofRouter<Router>().pushNamed(Routes.thirdPage,
        arguments: ThirdPageArguments(userName: '222', points: 5));
  }
}
