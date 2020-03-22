import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route_annotations.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../pages/initial_page.dart';
import '../pages/second_page.dart';
import '../pages/third_page.dart';

@MaterialAutoRouter(generateNavigationHelperExtension: true)
class $Router {
  @initial
  InitialPage initialPage;
  @CustomRoute(
      transitionsBuilder: TransitionsBuilders.slideTop,
      durationInMilliseconds: 4000)
  SecondPage secondPage;
  @MaterialRoute(fullscreenDialog: true)
  @GuardedBy([AuthGuard])
  ThirdPage thirdPage;
}

class AuthGuard extends RouteGuard {
  @override
  Future<bool> canNavigate(ExtendedNavigatorState<RouterBase> navigator,
      String routeName, Object arguments) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token_key') != null;
  }
}
