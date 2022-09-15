import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';
import 'button.dart';
import 'input_grids.dart';

class ResultView extends StatefulWidget {
  final Color btnBgColor;
  final String result;
  final RxList gridsNumberShow;
  final RxList pcGridsNumberShow;
  final RxBool girdsState;
  final RxList history;
  final Function inputNum;

  const ResultView(
      {Key? key,
      required this.btnBgColor,
      this.result = '',
      required this.gridsNumberShow,
      required this.pcGridsNumberShow,
      required this.girdsState,
      required this.history,
      required this.inputNum})
      : super(key: key);

  @override
  State<ResultView> createState() => _ResultViewState();
}

class _ResultViewState extends State<ResultView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('單機對戰中'),
        ),
        body: Center(
          child: SingleChildScrollView(
            //防止邊界溢出
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
                        child: Text(
                          widget.result,
                          style: const TextStyle(
                              fontSize: 40, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Button(
                    width: 140,
                    height: 45,
                    btnText: '回主畫面',
                    fn: () => Get.offAllNamed(Routes.HOME),
                    bgColor: widget.btnBgColor,
                    textSize: 20),
                const SizedBox(
                  height: 15,
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
