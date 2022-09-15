import 'package:bingo_flutter/app/widget/button.dart';
import 'package:bingo_flutter/app/widget/input_grids.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChoiceByOwnView extends StatefulWidget {
  final RxList gridsNumberShow;
  final Color btnBgColor;
  final RxBool girdsState;
  final RxList history;
  final Function inputNum;
  final Function gameStartNextBtnFn;

  const ChoiceByOwnView(
      {Key? key,
      required this.btnBgColor,
      required this.gridsNumberShow,
      required this.girdsState,
      required this.history,
      required this.inputNum,
      required this.gameStartNextBtnFn})
      : super(key: key);

  @override
  State<ChoiceByOwnView> createState() => _ChoiceByOwnViewState();
}

class _ChoiceByOwnViewState extends State<ChoiceByOwnView> {
  TextEditingController numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('單機對戰中'),
        ),
        body: Center(
          child: SizedBox(
            height: 500,
            child: Column(
              children: [
                const Text(
                  '請輸入號碼',
                  style: (TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                ),
                TextField(
                  controller: numberController,
                  style: const TextStyle(fontSize: 30),
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black))),
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 30,
                ),
                Button(
                    width: 100,
                    height: 45,
                    btnText: 'next',
                    fn: () {
                      widget.gameStartNextBtnFn(
                          numberController.text, widget.btnBgColor);
                      numberController.clear();
                      //TODO:把history改成Rx還是無法自己更新
                      setState(() {});
                    },
                    bgColor: widget.btnBgColor,
                    textSize: 20),
                const SizedBox(
                  height: 40,
                ),
                InputGrids(
                    gameStart: true,
                    newGame: widget.girdsState,
                    gridsNumber: widget.gridsNumberShow,
                    history: widget.history,
                    inputNum: widget.inputNum),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
