import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'button.dart';
import 'input_grids.dart';

class ChoiceByPc extends StatefulWidget {
  final controller;
  final Color btnBgColor;
  const ChoiceByPc(
      {Key? key, required this.controller, required this.btnBgColor})
      : super(key: key);

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
                    gridsNumber: widget.controller.gridsNumber),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                  color: Colors.black,
                  child: Row(
                    children: const <Widget>[
                      Expanded(
                        child: Text(
                          '30',
                          style: TextStyle(fontSize: 40, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
                // const TextField(
                //   enabled: false,
                //   style: TextStyle(fontSize: 30, color: Colors.white),
                //   decoration: InputDecoration(
                //       filled: true,
                //       fillColor: Colors.black,
                //       contentPadding: EdgeInsets.all(10.0),
                //       border: OutlineInputBorder(
                //           borderSide: BorderSide(color: Colors.black))),
                //   textAlign: TextAlign.center,
                //   keyboardType: TextInputType.number,
                // ),
                const SizedBox(
                  height: 10,
                ),
                Button(
                    width: 100,
                    height: 45,
                    btnText: 'next',
                    fn: () {},
                    bgColor: widget.btnBgColor,
                    textSize: 20),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  '玩家名',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                InputGrids(
                    gameStart: true,
                    newGame: widget.controller.girdsState,
                    gridsNumber: widget.controller.gridsNumber),
              ],
            ),
          ),
        ));
  }
}
