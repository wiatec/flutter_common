import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class Translations {

  Translations(Locale locale) {
    this.locale = locale;
    _localizedValues = null;
  }

  Locale locale;

  static Map<dynamic, dynamic> _localizedValues;

  static Translations of(BuildContext context){
    return Localizations.of<Translations>(context, Translations);
  }

  String text(String key) {
    return _localizedValues[key] ?? '** $key not found';
  }

  static Future<Translations> load(BuildContext context, Locale locale) async {
    Translations translations = new Translations(locale);
    String jsonContent = '';
    try {
      jsonContent = await rootBundle.loadString(
          "res/values/strings_${locale.languageCode}_${locale
              .countryCode}.arb");
      if(jsonContent == null || jsonContent.length <= 0) {
        print("current language json is empty, use default language json");
        jsonContent = await rootBundle.loadString("res/values/strings_en_US.arb");
      }
    }on Error catch (e) {
      print(e.toString());
      jsonContent =  await rootBundle.loadString("res/values/strings_en_US.arb");
    }
    _localizedValues = json.decode(jsonContent);
    return translations;
  }

  get currentLanguage => locale.languageCode;
  get currentCountry => locale.countryCode;

}

class TranslationsDelegate extends LocalizationsDelegate<Translations> {

  final BuildContext context;

  const TranslationsDelegate(this.context);

  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<Translations> load(Locale locale) => Translations.load(context, locale);

  @override
  bool shouldReload(TranslationsDelegate old) => false;

}
