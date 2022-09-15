import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../one_player/one_player_controller.dart';
import '../../../../widget/button.dart';
import '../../../../widget/input_grids.dart';

class InputGridsNumView extends StatefulWidget {
  final String description;
  final Function()renderBtnFn, nextBtnFn;
  final RxBool newGame;
  final Color bntBgColor;
  final RxString errorMS;
  final RxList gridsNumberShow;
  final RxBool girdsState;
  final Function inputNum;

  const InputGridsNumView({
    Key? key,
    required this.description,
    required this.renderBtnFn,
    required this.nextBtnFn,
    required this.newGame,
    required this.bntBgColor,
    required this.errorMS,
    required this.gridsNumberShow,
    required this.girdsState,
    required this.inputNum,
  }) : super(key: key);

  @override
  State<InputGridsNumView> createState() => _InputGridsNumViewState();
}

class _InputGridsNumViewState extends State<InputGridsNumView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.description,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 40,
        ),
        Obx(() => Text(
              widget.errorMS.value,
              style: const TextStyle(color: Colors.red),
            )),
        InputGrids(
          newGame: widget.girdsState,
          gridsNumber: widget.gridsNumberShow,
          inputNum: widget.inputNum,
        ),
        const SizedBox(
          height: 40,
        ),
        Button(
            textSize: 20,
            width: 150,
            height: 45,
            btnText: '隨機產生',
            fn: widget.renderBtnFn,
            bgColor: Colors.orangeAccent),
        const SizedBox(
          height: 60,
        ),
        Button(
            textSize: 20,
            width: 100,
            height: 45,
            btnText: 'next',
            fn: widget.nextBtnFn,
            bgColor: widget.bntBgColor),
      ],
    );
  }
}
