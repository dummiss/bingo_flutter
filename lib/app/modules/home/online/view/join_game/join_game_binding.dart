import 'package:get/get.dart';
import 'join_game_controller.dart';



class TwoPlayerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JoinGameController>(
      () => JoinGameController(),
    );
  }
}
