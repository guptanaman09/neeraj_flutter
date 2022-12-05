import 'package:flutter/material.dart';
import 'package:neeraj_flutter_app/locale/languages/en.dart';
import 'package:neeraj_flutter_app/locale/languages/hi.dart';

///Created by Naman Gupta on 19/4/21.

class DemoLocalizations {
  DemoLocalizations(this.locale);

  final Locale locale;

  static DemoLocalizations of(BuildContext context) {
    return Localizations.of<DemoLocalizations>(context, DemoLocalizations)!;
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': EN.english,
    'hi': HI.hindi,
  };

  String? get title => _localizedValues[locale.languageCode]?['get_started'];
  String? get something_went_wrong_try_agin =>
      _localizedValues[locale.languageCode]?['something_went_wrong_try_agin'];
  String? get please_check_your_internt_connection => _localizedValues[
      locale.languageCode]!['please_check_your_internt_connection'];

  String? get cancel => _localizedValues[locale.languageCode]?['cancel'];
  String? get welcome => _localizedValues[locale.languageCode]?['welcome'];
}
