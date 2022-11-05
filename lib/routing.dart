import 'package:flutter/material.dart';
import 'package:neeraj_flutter_app/constants/classes.dart';
import 'package:neeraj_flutter_app/ui/login_screen.dart';
import 'package:neeraj_flutter_app/ui/main_screen.dart';
import 'package:neeraj_flutter_app/ui/splash_screen.dart';

///Created by Naman Gupta on 19/4/21.
class Routing {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Classes.mainScreen:
        {
          return MaterialPageRoute(
              builder: (_) => MainScreen(),
              settings: RouteSettings(name: settings.name));
        }
      case Classes.loginScreen:
        {
          return MaterialPageRoute(
              builder: (_) => LoginScreen(),
              settings: RouteSettings(name: settings.name));
        }
      default:
        return MaterialPageRoute(
            builder: (_) => SplashScreen(), settings: settings);
    }
  }
}
