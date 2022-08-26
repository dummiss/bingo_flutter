import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../widget/input_grids_num_view.dart';
import 'one_player_controller.dart';

class OnePlayerView extends GetView<OnePlayerController> {
  const OnePlayerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(), //收鍵盤
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            // title: const Text('OnePlayer'),
            centerTitle: true,
          ),
          body: Center(
            child: InputGridsNumView(
              bntBgColor: Colors.red.shade200,
              controller: controller,
              newGame: controller.girdsState,
              description: '請在每個格子內\n輸入你的數字',
              nextBtnFn: () => controller.nextBtnFn(
                  btnBgColor: Colors.red.shade200, controller: controller),
              renderBtnFn: controller.randomBtnFn,
            ),
          )),
    );
  }
}
