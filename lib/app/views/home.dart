import 'package:finder_app/app/config/app.dart';
import 'package:finder_app/app/controllers/home.dart';
import 'package:finder_app/app/templates/elevated_button.dart';
import 'package:finder_app/core/ui/screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends CoreScreen<HomeController> {
  @override
  Widget mobileDevice() {
    return SafeArea(
      child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
          body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.cover,
              image: ExactAssetImage('assets/images/background.png'),
            )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: Get.width * 0.25,
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
                  child: Form(
                    key: controller.mobileFormKey,
                    child: TextFormField(
                      controller: controller.mobileController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: controller.mobileValidator,
                      keyboardType: TextInputType.phone,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                AppElevatedButton(
                  child: Text(
                    'تحقق',
                    style: Get.theme.textTheme.bodyMedium,
                  ),
                  onPressed: () => controller.launchWhatsApp(),
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
                  child: Text(
                    'تنويه \n هذا التطبيق يقوم بالتحقق من توفر رقم الهاتف المدخل لخدمة الواتساب وهو يعمل فقط داخل المملكة العربية السعودية',
                    textAlign: TextAlign.center,
                    style: Get.textTheme.bodyMedium!
                        .copyWith(color: Colors.black54),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
