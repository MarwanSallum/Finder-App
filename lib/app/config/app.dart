import 'package:finder_app/app/config/store.dart';
import 'package:finder_app/app/theme/src/dark.dart';
import 'package:finder_app/app/theme/src/light.dart';
import 'package:finder_app/core/utils/locale.dart';
import 'package:finder_app/core/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class App{
  static init() async{
    await Get.putAsync<CoreTheme>(() => LightTheme().init(), tag: 'light');
    await Get.putAsync<CoreTheme>(() => DarkTheme().init(), tag: 'dark');
    await Get.putAsync<CoreLocale>(() => CoreLocale().init());
    await Get.putAsync<AppStore>(() => AppStore().init());
  }

  static CoreTheme lightTheme = Get.find(tag: 'light');
  static CoreTheme darkTheme = Get.find(tag: 'dark');
  static CoreLocale coreLocale = Get.find();
  static AppStore appStore = Get.find();

  static screenOrientation( Widget widget){
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
          .then((_) => runApp(widget));
  }
}