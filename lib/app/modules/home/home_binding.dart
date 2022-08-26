import 'package:get/get.dart';

import '../../../core/utils/helper/grids_num_helper.dart';
import 'home_controller.dart';


class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GridsNumHelper());
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
