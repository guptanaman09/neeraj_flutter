import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:neeraj_flutter_app/constants/dimensions.dart';
import 'package:neeraj_flutter_app/store/splash/splash_store.dart';
import 'package:neeraj_flutter_app/widgets/vertical_gap.dart';

///Created by Naman Gupta on 19/4/21.

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplshScreenState();
  }
}

class SplshScreenState extends State<SplashScreen> {
  final Splash splashCounter = Splash();

  @override
  void initState() {
    splashCounter.checkLoggedIn();
    Timer(Duration(seconds: 3), () {
      splashCounter.setValue(true);
      splashCounter.changedScreen(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Observer(
              builder: (_) => Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          child: Icon(
                            Icons.supervised_user_circle_rounded,
                            size: 100,
                          ),
                        ),
                        VerticalGap(Dimensions.size_15),
                        Text(
                          "Splash: " + splashCounter.isLoggedIn.toString(),
                          style: TextStyle(fontSize: 24),
                        ),
                        kIsWeb
                            ? Text(
                                "OnWeb ",
                                style: TextStyle(fontSize: 24),
                              )
                            : Text("On Device")
                      ],
                    ),
                  ))),
    );
  }
}
