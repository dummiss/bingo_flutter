import 'package:flutter/material.dart';
import 'dart:math';
import 'package:get/get.dart';

class InputGrids extends StatefulWidget {
  final RxBool newGame;
  final RxList gridsNumber;
  final controller;
  final bool gameStart;

  const InputGrids(
      {Key? key,
      this.gameStart = false,
      required this.newGame,
      required this.gridsNumber,
      this.controller})
      : super(key: key);

  @override
  State<InputGrids> createState() => _InputGridsState();
}

class _InputGridsState extends State<InputGrids> {
  List test = [];
  var randomColor = Random().nextInt(Colors.primaries.length); //隨機背景顏色用
  // FocusNode focusNode=FocusNode();//鍵盤焦點
  //
  // @override
  // void dispose() {
  //   focusNode.dispose();
  //   super.dispose();
  // }
  //Todo:30把numberGrid存回firebase

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(20)), //隨機背景顏色
      child: Container(
        width: 230,
        height: 230,
        decoration: const BoxDecoration(),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5, //一行5個item
          ),
          itemCount: 25, //共25個item
          itemBuilder: (context, index) {
            //二維陣列：故計算是第幾row的第幾個出來
            int whichRow = index ~/ 5.floor();
            int numberIndex = index % 5;

            return GridTile(child: Obx(() {
              return Container(
                decoration: BoxDecoration(
                    color: Colors.primaries[randomColor],
                    border: Border.all(
                        width: 1,
                        style: BorderStyle.solid,
                        color: Colors.white)),
                child: Center(
                    child: TextField(
                  readOnly: widget.gameStart,
                  controller:
                      //Todo: 把下面63改成從firebase撈回的資料
                      widget.newGame.value //判斷是否是新遊戲，true：顯示輸入框, false:顯示數字
                          ? null
                          : (TextEditingController()
                            ..text = widget.gridsNumber[whichRow][numberIndex]
                                .toString()),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    widget.controller.test(value, whichRow, numberIndex);
                  },
                )),
              );
            }));
          },
        ),
      ),
    );
  }
}
