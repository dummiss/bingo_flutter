import 'package:bingo_flutter/app/widget/button.dart';
import 'package:bingo_flutter/app/widget/start_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'choice_by_own_view.dart';
import 'choice_by_pc.dart';

class ChooseView extends StatefulWidget {
  final Color btnBgColor;
  final controller;
  const ChooseView(
      {Key? key, required this.btnBgColor, required this.controller})
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
                          controller: widget.controller,
                          btnBgColor: widget.btnBgColor,
                          routeName: ChoiceByOwnView(
                              btnBgColor: widget.btnBgColor,
                              controller: widget.controller, gridsNumberShow: widget.controller.gridsNumberShow,),
                        ));
                    widget.controller.createGame('自選號碼');
                    print('${widget.controller.gridsNumberShow}');
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
                          controller: widget.controller,
                          btnBgColor: widget.btnBgColor,
                          routeName: ChoiceByPc(
                              btnBgColor: widget.btnBgColor,
                              controller: widget.controller),
                        ));
                    widget.controller.createGame('電腦叫號');
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
