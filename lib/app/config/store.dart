import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStore extends GetxService{

  late SharedPreferences _sharedPreferences;

  final String _themeMode = 'theme_mode';
  final String _locale = 'locale';

  Future<AppStore> init() async{
    _sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }

  saveThemeMode(ThemeMode themeMode) async{
    await _sharedPreferences.setString(_themeMode, themeMode.toString());
    Get.changeThemeMode(themeMode);
  }

  ThemeMode getThemeMode(){
    String? saveThemeMode = _sharedPreferences.getString(_themeMode);
    if(saveThemeMode == null) return ThemeMode.system;
    if(saveThemeMode == ThemeMode.system.toString()) return ThemeMode.system;
    if(saveThemeMode == ThemeMode.light.toString()) return ThemeMode.light;
    if(saveThemeMode == ThemeMode.dark.toString()) return ThemeMode.dark;
    return ThemeMode.system;
  }

  saveLocale(Locale locale) async{
    await _sharedPreferences.setString(_locale, locale.languageCode);
    await Get.updateLocale(locale);
  }

  Locale getLocale(){
    String? languageCode = _sharedPreferences.getString(_locale);
    return languageCode != null ? Locale(languageCode) : Get.deviceLocale!;
  }

}