import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../choose_view/choose_view.dart';
import '../input_grids_num_view/input_grids_num_view.dart';
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
              newGame: controller.girdsState,
              description: '請在每個格子內\n輸入你的數字',
              renderBtnFn: controller.randomBtnFn,
              girdsState: controller.girdsState,
              inputNum: controller.inputNum,
              gridsNumberShow: controller.gridsNumberShow,
              errorMS: controller.errorMS,
              nextBtnFn: () {
                bool res =
                    controller.nextBtnFn(btnBgColor: Colors.red.shade200);
                if (res == true) {
                  Get.to(() => ChooseView(
                        btnBgColor: Colors.red.shade200,
                        createGame: controller.createGame,
                        gameStartNextBtnFn: controller.gameStartNextBtnFn,
                        girdsState: controller.girdsState,
                        history: controller.history,
                        selectNumByRandom: controller.selectNumByRandom,
                        pcGridsNumberShow: controller.pcGridsNumberShow,
                        inputNum: controller.inputNum,
                        selectNum: controller.selectNum,
                        gridsNumberShow: controller.gridsNumberShow,
                      ));
                  controller.girdsState.value = false;
                }
              },
            ),
          )),
    );
  }
}
