import 'package:flutter/material.dart';
import 'package:neeraj_flutter_app/constants/classes.dart';
import 'package:neeraj_flutter_app/models/main_category_model.dart';
import 'package:neeraj_flutter_app/models/offline_category_model.dart';

import 'package:neeraj_flutter_app/test_ble.dart';

import 'package:neeraj_flutter_app/ui/free_run_screen.dart';

import 'package:neeraj_flutter_app/ui/iot_screen.dart';
import 'package:neeraj_flutter_app/ui/line_follower_game_screen.dart';
import 'package:neeraj_flutter_app/ui/login_screen.dart';
import 'package:neeraj_flutter_app/ui/main_screen.dart';
import 'package:neeraj_flutter_app/ui/offline_game_play_screen.dart';
import 'package:neeraj_flutter_app/ui/offline_main_cat_screen.dart';
import 'package:neeraj_flutter_app/ui/offline_sub_category_screen.dart';
import 'package:neeraj_flutter_app/ui/online_iot_screen.dart';
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
      case Classes.onlineIOTScreen:
        {
          return MaterialPageRoute(
              builder: (_) => OnlineIOTScreen(),
              settings: RouteSettings(name: settings.name));
        }
      case Classes.offlineMainCategoryScreen:
        {
          return MaterialPageRoute(
              builder: (_) => OfflineMainCategoryScreen(),
              settings: RouteSettings(name: settings.name));
        }
      case Classes.offlineSubCategoryScreen:
        {
          return MaterialPageRoute(
              builder: (_) => OfflineSubCategoryScreen(
                  settings.arguments as OfflineMainCategoryDetail),
              settings: RouteSettings(name: settings.name));
        }

      case Classes.bluetoothBle:
        return MaterialPageRoute(
            builder: (_) => FlutterBlueApp(),
            settings: RouteSettings(name: settings.name));

      case Classes.freeRunScreen:
        {
          return MaterialPageRoute(
              builder: (_) =>
                  FreeRunScreen(settings.arguments as SubCategoryDetail),
              settings: RouteSettings(name: settings.name));
        }

      case Classes.lineFollowerGameScreen:
        {
          return MaterialPageRoute(
              builder: (_) => LineFollowerGameScreen(
                  settings.arguments as SubCategoryDetail),
              settings: RouteSettings(name: settings.name));
        }

      case Classes.offLineGamePlayScreen:
        {
          return MaterialPageRoute(
              builder: (_) => OfflineGamePlayScreen(
                  settings.arguments as OfflineSubCategoryDetail),
              settings: RouteSettings(name: settings.name));
        }

      default:
        return MaterialPageRoute(
            builder: (_) => SplashScreen(), settings: settings);
    }
  }
}
