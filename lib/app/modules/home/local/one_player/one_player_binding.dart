import 'package:get/get.dart';

import '../local_controller.dart';
import 'one_player_controller.dart';

class OnePlayerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnePlayerController>(
      () => OnePlayerController(),
    );
   Get.put(LocalController());
  }
}
