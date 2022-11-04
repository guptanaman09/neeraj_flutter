import 'package:flutter/material.dart';

///Created by Naman Gupta on 19/4/21.
import 'package:mobx/mobx.dart';
import 'package:neeraj_flutter_app/constants/classes.dart';
import 'package:neeraj_flutter_app/data/shared_preference/my_shared_preference.dart';

part 'splash_store.g.dart';

class Splash = _SplashStore with _$Splash;

abstract class _SplashStore with Store {
  @observable
  bool isLoggedIn = false;

  @action
  Future<void> checkLoggedIn() async {
    if (await MySharedPreference.getBoolean(MySharedPreference.IS_LOGGED_IN) !=
        null)
      isLoggedIn = await MySharedPreference.getBoolean(
              MySharedPreference.IS_LOGGED_IN) ??
          false;
    else
      isLoggedIn = false;
  }

  @action
  void setValue(bool val) {
    isLoggedIn = val;
  }

  @action
  changedScreen(BuildContext context) {
    Navigator.pushNamed(context, Classes.loginScreen);
  }
}
