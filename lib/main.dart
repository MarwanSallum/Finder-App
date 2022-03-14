import 'package:finder_app/app/binding/home.dart';
import 'package:finder_app/app/config/app.dart';
import 'package:finder_app/app/views/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await App.init();
  App.screenOrientation(const FinderApp());
}

class FinderApp extends StatelessWidget {
  const FinderApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: App.lightTheme.themeDataDesign(),
      darkTheme: App.darkTheme.themeDataDesign(),
      themeMode: App.appStore.getThemeMode(),
      translations: App.coreLocale,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: App.coreLocale.supportedLocales.map((localCode) => Locale(localCode)).toList(),
      fallbackLocale: Get.deviceLocale,
      initialBinding: HomeBinding(),
      home: HomeScreen(),
    );
  }
}

