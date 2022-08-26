import 'package:bingo_flutter/app/widget/button.dart';
import 'package:bingo_flutter/app/widget/input_grids.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'choice_by_pc.dart';

class ChoiceByOwnView extends StatefulWidget {
  final Color btnBgColor;
  final controller;
  const ChoiceByOwnView(
      {Key? key, required this.btnBgColor, required this.controller})
      : super(key: key);


  @override
  State<ChoiceByOwnView> createState() => _ChoiceByOwnViewState();
}

class _ChoiceByOwnViewState extends State<ChoiceByOwnView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('單機對戰中'),
        ),
        body: Center(
          child: Container(
            height: 500,
            child: Column(
              children: [
                const Text(
                  '請輸入號碼',
                  style: (TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                ),
                const TextField(
                  style: TextStyle(fontSize: 30),
                  decoration: InputDecoration(
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
                      Get.to(ChoiceByPc(controller:widget.controller,btnBgColor:widget.btnBgColor));
                    },
                    bgColor: widget.btnBgColor,
                    textSize: 20),
                const SizedBox(
                  height: 40,
                ),
                InputGrids(
                    gameStart: true,
                    newGame: widget.controller.girdsState,
                    gridsNumber: widget.controller.gridsNumber),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
