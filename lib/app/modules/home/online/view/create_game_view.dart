import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../data/models/game_data_model.dart';
import '../../../../widget/button.dart';
import 'game_way_view.dart';

class CreateGameView extends StatefulWidget {
  final TextEditingController yourName;
  final RxString gameId;
  final RxBool isJoin;
  final Rx<GameDataModel>? gameData; //todo:有可能有safe null 問題
  const CreateGameView({
    Key? key,
    required this.yourName,
    required this.gameId,
    required this.isJoin,
    required this.gameData,
  }) : super(key: key);

  @override
  State<CreateGameView> createState() => _CreateGameViewState();
}

class _CreateGameViewState extends State<CreateGameView> {
  TextStyle textStyle =
      const TextStyle(fontWeight: FontWeight.w600, fontSize: 20);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(), //收鍵盤
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: const Text('正在建立房間中'),
            centerTitle: true,
          ),
          body: Center(
            child: SizedBox(
              width: 300,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '你的名字：',
                          style: textStyle,
                        ),
                        Text(
                          widget.yourName.text,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.red),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    Text(widget.gameId.toString(), style: textStyle),
                    QrImage(
                      data: widget.gameId.toString(),
                      version: QrVersions.auto,
                      size: 200.0,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      '參與玩家',
                      style: textStyle,
                    ),
                    const Divider(color: Colors.black, thickness: 1),
                    widget.isJoin.value == true
                        ? Obx(() => SizedBox(
                              height: 200,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  //TODO:可能會報錯
                                  itemCount: 1,
                                  // widget.gameData == null
                                  //     ? 0
                                  //     : widget.gameData!.value.player.length,
                                  itemExtent: 20.0, //强制高度为50.0
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return ListTile(
                                        title: Text(
                                          '',
                                      // widget.gameData == null
                                      //     ? ''
                                      //     : widget
                                      //         .gameData!.value.player[index],
                                      textAlign: TextAlign.center,
                                    ));
                                  }),
                            ))
                        : const SizedBox(),
                    Button(
                        textSize: 20,
                        width: 130,
                        height: 45,
                        btnText: '遊戲開始',
                        fn: () {
                          Get.to(() => const GameWayView());
                        },
                        bgColor: Colors.blue),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
