import 'package:get/get.dart';

import 'local_controller.dart';

class LocalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocalController>(
      () => LocalController(),
    );
  }
}
