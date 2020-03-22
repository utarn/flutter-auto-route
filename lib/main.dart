import 'package:auto_route/auto_route.dart';
import 'package:auto_route_tutorial/pages/initial_page.dart';
import 'package:flutter/material.dart';

import 'routes/router.dart';
import 'routes/router.gr.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: InitialPage(),
      initialRoute: Routes.initialPage,
      builder: ExtendedNavigator<Router>(
        router: Router(),
        guards: [AuthGuard()],
      ),
    );
  }
}
