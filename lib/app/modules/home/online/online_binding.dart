import 'package:get/get.dart';

import 'online_controller.dart';



class OnlineBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnlineController>(
      () => OnlineController(),
    );
  }
}
