import 'package:get/get.dart';

import '../../../core/utils/helper/grids_num_helper.dart';
import '../../../core/utils/helper/line_check_helper.dart';
import '../../data/providers/providers/firebase_provider.dart';
import 'home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GridsNumHelper());
    Get.put(LineCheckHelper());

    Get.put(FirebaseProvider());

    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
