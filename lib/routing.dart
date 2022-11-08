import 'package:flutter/material.dart';
import 'package:neeraj_flutter_app/constants/classes.dart';
import 'package:neeraj_flutter_app/models/main_category_model.dart';
import 'package:neeraj_flutter_app/ui/iot_screen.dart';
import 'package:neeraj_flutter_app/ui/login_screen.dart';
import 'package:neeraj_flutter_app/ui/main_screen.dart';
import 'package:neeraj_flutter_app/ui/splash_screen.dart';
import 'package:neeraj_flutter_app/ui/sub_category_screen.dart';

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
      case Classes.subCategory:
        {
          return MaterialPageRoute(
              builder: (_) =>
                  SubCategoryScreen(settings.arguments as MainCategoryDetail),
              settings: RouteSettings(name: settings.name));
        }
      case Classes.iotScreen:
        {
          return MaterialPageRoute(
              builder: (_) => IOTScreen(),
              settings: RouteSettings(name: settings.name));
        }
      default:
        return MaterialPageRoute(
            builder: (_) => SplashScreen(), settings: settings);
    }
  }
}
