import 'package:finder_app/core/contracts/controller.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';


class HomeController extends CoreController{
  GlobalKey<FormState> mobileFormKey = GlobalKey<FormState>();
  TextEditingController mobileController = TextEditingController();

  @override
  void onClose() {
    mobileController.dispose();
    super.onClose();
  }

   var mobileValidator = MultiValidator([
    RequiredValidator(errorText: 'يجب إدخال رقم'),
    LengthRangeValidator(min: 10, max: 10, errorText: 'رقم الهاتف يتكون من 10 أرقام'),
  ]);

  launchWhatsApp() async{
    if(mobileFormKey.currentState!.validate()){
      try{
        mobileFormKey.currentState!.save();
        var _url = "https://api.whatsapp.com/send?phone=966";
        await launch(_url + mobileController.text);
      }catch(error){
        Get.snackbar('خطأ', error.toString());
      }
    }
  }
}