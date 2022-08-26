import 'package:get/get.dart';

import 'two_player_controller.dart';

class TwoPlayerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TwoPlayerController>(
      () => TwoPlayerController(),
    );
  }
}
