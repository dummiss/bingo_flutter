import 'package:get/get.dart';
import 'game_way_controller.dart';



class GameWayBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GameWayController>(
      () => GameWayController(),
    );
  }
}
