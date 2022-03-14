import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CoreLocale extends Translations{

  late Map<String,Map<String,String>> languages;
  List<String> supportedLocales = ['en', 'ar'];

  Future<CoreLocale> init() async{
    languages = {};
    for(String supportedLocate in supportedLocales){
      try{
        String localeString = await rootBundle.loadString('assets/files/locales/$supportedLocate.json');
        languages[supportedLocate] = Map<String,String>.from(jsonDecode(localeString));
      }catch(e){
        throw Exception('can not load language');
      }
    }
    return this;
  }

  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => languages;
}