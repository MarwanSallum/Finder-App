import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class CoreTheme
{
  ThemeData get baseTheme;
  String get fileName;

  Color get primaryColor => getColor('primary_color');
  Color get secondaryColor => getColor('secondary_color');
  Color get infoColor => getColor('info_colo');
  Color get warningColor => getColor('warning_color');
  Color get successColor => getColor('success_color');
  Color get dangerColor => getColor('danger_color');

  set baseTheme(ThemeData baseTheme){
    this.baseTheme = baseTheme;
  }

  late Map<String, String>  settings;

  Future<CoreTheme> init() async{
    try{
      String data = await rootBundle.loadString('assets/files/themes/$fileName');
      settings = Map<String,String>.from(jsonDecode(data));
    }catch(e){
      throw Exception('No file could be loaded, or the data is not formatted as required');
    }
    return this;
  }

  Color getColor(String key){
    String? value = settings[key];
    return Color(int.tryParse('0xff$value') ?? 0xffff8d00);
  }

  ThemeData themeDataDesign();

}