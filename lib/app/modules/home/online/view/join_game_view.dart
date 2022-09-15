import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/models/game_data_model.dart';
import '../../../../widget/button.dart';
import 'scan_qr.dart';

class JoinGameView extends StatefulWidget {
  final TextEditingController inputGameId;
  final Function joinRoomCheckBtn;
  final RxBool isJoin;
  final Rx<GameDataModel>? gameData;

  const JoinGameView(
      {Key? key,
      required this.inputGameId,
      required this.joinRoomCheckBtn,
      required this.isJoin,
      this.gameData})
      : super(key: key);

  @override
  State<JoinGameView> createState() => _JoinGameViewState();
}

class _JoinGameViewState extends State<JoinGameView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(), //收鍵盤
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: const Text('正在加入房間'),
            centerTitle: true,
          ),
          body: Center(
            child: SizedBox(
              width: 300,
              child: SingleChildScrollView(
                child: Obx(() => Column(
                      children: [
                        const Text(
                          '請輸入房間號碼：',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                            width: 265,
                            child: TextField(
                              controller: widget.inputGameId,
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: const Icon(Icons.qr_code_scanner),
                                    onPressed: () async {
                                      widget.inputGameId.text =
                                          await Get.to(() => const QRScanner());
                                    },
                                  ),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade300,
                                          width: 32.0),
                                      borderRadius:
                                          BorderRadius.circular(25.0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade300,
                                          width: 32.0),
                                      borderRadius:
                                          BorderRadius.circular(25.0))),
                            )),
                        IconButton(
                            iconSize: 50,
                            color: Colors.orange,
                            onPressed: () {
                              widget.joinRoomCheckBtn(
                                  gameId: widget.inputGameId.text);
                            },
                            icon: const Icon(Icons.check_circle)),
                        const SizedBox(
                          height: 50,
                        ),
                        widget.isJoin.value == true
                            ? const Text(
                                '參與玩家',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 20),
                              )
                            : const SizedBox(),
                        const Divider(color: Colors.black, thickness: 1),
                        widget.isJoin.value == true
                            ? SizedBox(
                                height: 200,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: widget.gameData == null
                                        ? 0
                                        : widget.gameData!.value.player.length,
                                    itemExtent: 20.0, //强制高度为50.0
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return ListTile(
                                          title: Text(
                                        widget.gameData == null
                                            ? ''
                                            : widget
                                                .gameData!.value.player[index],
                                        textAlign: TextAlign.center,
                                      ));
                                    }),
                              )
                            : const SizedBox(),
                        // widget.controller.isJoin == true
                        //     ? Button(
                        //         textSize: 20,
                        //         width: 105,
                        //         height: 45,
                        //         btnText: 'ready',
                        //         fn: () {},
                        //         bgColor: Colors.blue)
                        //     : const SizedBox(),
                      ],
                    )),
              ),
            ),
          )),
    );
  }
}
