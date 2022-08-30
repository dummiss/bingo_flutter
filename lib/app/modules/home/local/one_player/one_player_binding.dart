import 'package:get/get.dart';
import 'one_player_controller.dart';

class OnePlayerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnePlayerController>(
      () => OnePlayerController(),
    );
  }
}
