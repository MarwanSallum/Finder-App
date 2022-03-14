import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class CoreScreen<Controller> extends GetResponsiveView<Controller>{

  Widget mobileDevice();

  @override
  Widget phone() {
    return mobileDevice();
  }
}