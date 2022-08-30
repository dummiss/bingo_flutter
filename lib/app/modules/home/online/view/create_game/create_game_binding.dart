import 'package:get/get.dart';

import 'create_game_controller.dart';




class TwoPlayerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateGameController>(
      () => CreateGameController(),
    );
  }
}
