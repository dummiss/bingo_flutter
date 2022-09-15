import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'button.dart';
import 'input_grids.dart';

class ChoiceByPc extends StatefulWidget {
  final Color btnBgColor;
  final RxBool girdsState;
  final RxList gridsNumberShow;
  final RxList pcGridsNumberShow;
  final RxList history;
  final Function inputNum;
  final RxInt selectNum;
  final Function selectNumByRandom;
  final Function gameStartNextBtnFn;

  const ChoiceByPc({
    Key? key,
    required this.btnBgColor,
    required this.girdsState,
    required this.gridsNumberShow,
    required this.pcGridsNumberShow,
    required this.history,
    required this.inputNum,
    required this.selectNum,
    required this.selectNumByRandom,
    required this.gameStartNextBtnFn,
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
                  newGame: widget.girdsState,
                  gridsNumber: widget.pcGridsNumberShow,
                  history: widget.history,
                  inputNum: widget.inputNum,
                ),
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
                              widget.selectNum.toString(),
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
                      widget.gameStartNextBtnFn(
                          widget.selectNumByRandom().toString(),
                          widget.btnBgColor);
                      //TODO:把history改成Rx還是無法自己更新
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
                  newGame: widget.girdsState,
                  gridsNumber: widget.gridsNumberShow,
                  history: widget.history,
                  inputNum: widget.inputNum,
                ),
              ],
            ),
          ),
        ));
  }
}
