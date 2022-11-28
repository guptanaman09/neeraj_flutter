import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:neeraj_flutter_app/constants/classes.dart';
import 'package:neeraj_flutter_app/locale/languages/app_localizations.dart';
import 'package:neeraj_flutter_app/routing.dart';
import 'package:flutter/services.dart';
import 'package:neeraj_flutter_app/connectivity/bluettoth_coneectivty.dart';
import 'package:neeraj_flutter_app/test_ble.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyAPYWtHSLSlrcWcrJj9waKwN90rcl8eB64",
        appId: "1:802003028872:android:52d672125089e63fe3483d",
        messagingSenderId: "802003028872",
        projectId: "iot-cloud-02"),
  );
  AppLocalizations();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: [const Locale('en'), const Locale('hi')],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: Routing.generateRoute,
      initialRoute: Classes.mainScreen,
    );
  }
}
