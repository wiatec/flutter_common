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

  static Future<Translations> load(Locale locale) async {
    Translations translations = new Translations(locale);
    String jsonContent = await rootBundle.loadString(
          "res/values/strings_${locale.languageCode}_${locale.countryCode}.arb");
    if(jsonContent == null || jsonContent.length <= 0){
      jsonContent = await rootBundle.loadString(
          "res/values/strings_en_US.arb");
    }
    _localizedValues = json.decode(jsonContent);
    return translations;
  }

  get currentLanguage => locale.languageCode;
  get currentCountry => locale.countryCode;

}

class TranslationsDelegate extends LocalizationsDelegate<Translations> {

  const TranslationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'zh', 'es', 'cz', 'sk'].contains(locale.languageCode);

  @override
  Future<Translations> load(Locale locale) => Translations.load(locale);

  @override
  bool shouldReload(TranslationsDelegate old) => false;

}
