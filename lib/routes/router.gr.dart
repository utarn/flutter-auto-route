// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_route_tutorial/pages/initial_page.dart';
import 'package:auto_route_tutorial/pages/second_page.dart';
import 'package:auto_route_tutorial/pages/third_page.dart';
import 'package:auto_route_tutorial/routes/router.dart';

abstract class Routes {
  static const initialPage = '/';
  static const secondPage = '/second-page';
  static const thirdPage = '/third-page';
}

class Router extends RouterBase {
  @override
  Map<String, List<Type>> get guardedRoutes => {
        Routes.thirdPage: [AuthGuard],
      };

  //This will probably be removed in future versions
  //you should call ExtendedNavigator.ofRouter<Router>() directly
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<Router>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.initialPage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => InitialPage(),
          settings: settings,
        );
      case Routes.secondPage:
        if (hasInvalidArgs<String>(args, isRequired: true)) {
          return misTypedArgsRoute<String>(args);
        }
        final typedArgs = args as String;
        return PageRouteBuilder<dynamic>(
          pageBuilder: (ctx, animation, secondaryAnimation) =>
              SecondPage(userId: typedArgs),
          settings: settings,
          transitionsBuilder: TransitionsBuilders.slideTop,
          transitionDuration: const Duration(milliseconds: 4000),
        );
      case Routes.thirdPage:
        if (hasInvalidArgs<ThirdPageArguments>(args, isRequired: true)) {
          return misTypedArgsRoute<ThirdPageArguments>(args);
        }
        final typedArgs = args as ThirdPageArguments;
        return MaterialPageRoute<dynamic>(
          builder: (_) =>
              ThirdPage(userName: typedArgs.userName, points: typedArgs.points),
          settings: settings,
          fullscreenDialog: true,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

//**************************************************************************
// Arguments holder classes
//***************************************************************************

//ThirdPage arguments holder class
class ThirdPageArguments {
  final String userName;
  final int points;
  ThirdPageArguments({@required this.userName, @required this.points});
}

//**************************************************************************
// Navigation helper methods extension
//***************************************************************************

extension RouterNavigationHelperMethods on ExtendedNavigatorState {
  Future pushInitialPage() => pushNamed(Routes.initialPage);
  Future pushSecondPage({
    @required String userId,
  }) =>
      pushNamed(Routes.secondPage, arguments: userId);
  Future pushThirdPage(
          {@required String userName,
          @required int points,
          OnNavigationRejected onReject}) =>
      pushNamed(Routes.thirdPage,
          arguments: ThirdPageArguments(userName: userName, points: points),
          onReject: onReject);
}
