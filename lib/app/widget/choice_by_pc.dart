import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'button.dart';
import 'input_grids.dart';

class ChoiceByPc extends StatefulWidget {
  final controller;
  final Color btnBgColor;

  const ChoiceByPc({
    Key? key,
    required this.controller,
    required this.btnBgColor,
  }) : super(key: key);

  @override
  State<ChoiceByPc> createState() => _ChoiceByPcState();
}

class _ChoiceByPcState extends State<ChoiceByPc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('單機對戰中'),
        ),
        body: Center(
          child: SizedBox(
            height: 700,
            child: Column(
              children: [
                const Text(
                  '電腦',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                InputGrids(
                    gameStart: true,
                    newGame: widget.controller.girdsState,
                    gridsNumber: widget.controller.pcGridsNumberShow,
                    history: widget.controller.history),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                  color: Colors.black,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Obx(() => Text(
                              widget.controller.selectNum.toString(),
                              style: const TextStyle(
                                  fontSize: 40, color: Colors.white),
                              textAlign: TextAlign.center,
                            )),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Button(
                    width: 100,
                    height: 45,
                    btnText: 'next',
                    fn: () {

                      widget.controller.gameStartNextBtnFn(
                          widget.controller.selectNumByRandom().toString(),
                          widget.controller,
                          widget.btnBgColor);
                      setState(() {});
                    },
                    bgColor: widget.btnBgColor,
                    textSize: 20),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  '玩家',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                InputGrids(
                    gameStart: true,
                    newGame: widget.controller.girdsState,
                    gridsNumber: widget.controller.gridsNumberShow,
                    history: widget.controller.history),
              ],
            ),
          ),
        ));
  }
}
