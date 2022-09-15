import 'package:bingo_flutter/app/widget/button.dart';
import 'package:bingo_flutter/app/widget/start_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../widget/choice_by_own_view.dart';
import '../../../../widget/choice_by_pc_view.dart';

class ChooseView extends StatefulWidget {
  final Color btnBgColor;
  final RxList gridsNumberShow;
  final RxList pcGridsNumberShow;
  final RxBool girdsState;
  final RxList history;
  final Function inputNum;
  final RxInt selectNum;
  final Function selectNumByRandom;
  final Function gameStartNextBtnFn;
  final Function createGame;
  const ChooseView(
      {Key? key,
      required this.btnBgColor,
      required this.gridsNumberShow,
      required this.pcGridsNumberShow,
      required this.girdsState,
      required this.history,
      required this.inputNum,
      required this.selectNum,
      required this.selectNumByRandom,
      required this.gameStartNextBtnFn,
      required this.createGame})
      : super(key: key);

  @override
  State<ChooseView> createState() => _ChooseViewState();
}

class _ChooseViewState extends State<ChooseView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChooseView'),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          height: 300,
          child: Column(
            children: [
              const Text(
                '請選擇玩法',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 50,
              ),
              Button(
                  textSize: 20,
                  width: 150,
                  height: 45,
                  btnText: '自選號碼',
                  fn: () {
                    Get.to(() => StartView(
                          btnBgColor: widget.btnBgColor,
                          routeName: ChoiceByOwnView(
                            btnBgColor: widget.btnBgColor,
                            gridsNumberShow: widget.gridsNumberShow,
                            gameStartNextBtnFn: widget.gameStartNextBtnFn,
                            girdsState: widget.girdsState,
                            inputNum: widget.inputNum,
                            history: widget.history,
                          ),
                        ));
                    widget.createGame('自選號碼');
                    print('${widget.gridsNumberShow}');
                  },
                  bgColor: Colors.orangeAccent),
              const SizedBox(
                height: 20,
              ),
              Button(
                  textSize: 20,
                  width: 150,
                  height: 45,
                  btnText: '電腦叫號',
                  fn: () {
                    Get.to(() => StartView(
                          btnBgColor: widget.btnBgColor,
                          routeName: ChoiceByPc(
                            btnBgColor: widget.btnBgColor,
                            girdsState: widget.girdsState,
                            gridsNumberShow: widget.gridsNumberShow,
                            selectNum: widget.selectNum,
                            pcGridsNumberShow: widget.pcGridsNumberShow,
                            inputNum: widget.inputNum,
                            selectNumByRandom: widget.selectNumByRandom,
                            history: widget.history,
                            gameStartNextBtnFn: widget.gameStartNextBtnFn,
                          ),
                        ));
                    widget.createGame('電腦叫號');
                  },
                  bgColor: Colors.orangeAccent),
            ],
          ),
        ),
      ),
    );
  }
}

// class ChooseView extends GetView {
//   final controller;
//   const ChooseView(this.controller, {Key? key}) : super(key: key);
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('ChooseView'),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Container(
//           height: 300,
//           child: Column(
//             children: [
//               const Text(
//                 '請選擇玩法',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
//               ),
//               const SizedBox(
//                 height: 50,
//               ),
//               Button(
//                   textSize: 20,
//                   width: 150,
//                   height: 45,
//                   btnText: '自選號碼',
//                   fn: () {},
//                   bgColor: Colors.orangeAccent),
//               const SizedBox(
//                 height: 20,
//               ),
//               Button(
//                   textSize: 20,
//                   width: 150,
//                   height: 45,
//                   btnText: '電腦叫號',
//                   fn: () {},
//                   bgColor: Colors.orangeAccent),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
