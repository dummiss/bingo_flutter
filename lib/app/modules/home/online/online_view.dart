//TODO:為什麽系統建議是用import 'package：
import 'package:bingo_flutter/app/modules/home/online/view/create_game_view.dart';
import 'package:bingo_flutter/app/modules/home/online/view/join_game_view.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widget/input_grids.dart';
import '../../../widget/button.dart';

import '../../../widget/showAlertDialog.dart';
import 'online_controller.dart';

class OnlineView extends GetView<OnlineController> {
  const OnlineView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(), //收鍵盤
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: const Text('建立新遊戲'),
            centerTitle: true,
          ),
          body: Center(
            child: SizedBox(
              width: 300,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Text(
                      '請輸入你的名字：',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        width: 250,
                        child: TextField(
                          textAlign: TextAlign.center,
                          controller: controller.yourName,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey.shade300, width: 32.0),
                                  borderRadius: BorderRadius.circular(25.0)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey.shade300, width: 32.0),
                                  borderRadius: BorderRadius.circular(25.0))),
                        )),
                    const SizedBox(
                      height: 60,
                    ),
                    const Text(
                      '請在以下每個格子內輸入數字：',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InputGrids(
                        newGame: controller.girdsState,
                        gridsNumber: controller.gridsNumberShow,
                        inputNum: controller.inputNum),
                    const SizedBox(
                      height: 20,
                    ),
                    Button(
                        textSize: 20,
                        width: 150,
                        height: 45,
                        btnText: '自動產生',
                        fn: () {
                          controller.randomBtnFn();
                        },
                        bgColor: Colors.orangeAccent),
                    const SizedBox(
                      height: 70,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Button(
                            textSize: 20,
                            width: 150,
                            height: 45,
                            btnText: '建立新房間',
                            fn: () {
                              controller.createRoomBtnFn();
                            },
                            bgColor: Colors.blue),
                        Button(
                            textSize: 20,
                            width: 130,
                            height: 45,
                            btnText: '加入房間',
                            fn: () {
                              Get.to(() => JoinGameView(
                                    isJoin: controller.isJoin,
                                    joinRoomCheckBtn:
                                        controller.joinRoomCheckBtn,
                                    inputGameId: controller.inputGameId,
                                  ));
                            },
                            bgColor: Colors.blue),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
