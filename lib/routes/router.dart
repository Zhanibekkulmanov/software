import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../auth/pages/auth_screen.dart';
import 'routes_const.dart';



class InnLabRouter {

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {

    final parts = routeSettings.name!.split('?');

    switch (parts[0]) {
      case AuthRoute:
        return CupertinoPageRoute(
          settings: routeSettings,
          builder: (_) => AuthScreen(intro: routeSettings.arguments,),
        );
      default:
        return CupertinoPageRoute(
          settings: routeSettings,
          builder: (_) =>
              CupertinoPageScaffold(
                navigationBar: CupertinoNavigationBar(
                  middle: Text('Навигация'),
                ),
                child: Center(
                  child: Text(
                    'Ошибка, роут для ${routeSettings.name} не найден',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
        );
    }
  }
}
