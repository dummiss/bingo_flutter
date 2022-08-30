import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../widget/button.dart';
import '../../../widget/input_grids.dart';
import 'online_controller.dart';

class OnlineView extends GetView<OnlineController> {
  const OnlineView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(), //收鍵盤
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            // title: const Text('OnePlayer'),
            centerTitle: true,
          ),
          body: Center(
            child: Container(
              width: 300,
              child: SingleChildScrollView(
                child: Column(

                  children: [
                    const Text(
                      '請輸入你的名字：',
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                    ),
                    const SizedBox(width: 250, child: const TextField()),
                    const SizedBox(
                      height: 80,
                    ),
                    const Text(
                      '請在以下每個格子內輸入數字：',
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                    ),
                    const SizedBox(height: 20,),
                    InputGrids(
                        newGame: controller.girdsState,
                        gridsNumber: controller.gridsNumberShow),
                    const SizedBox(height: 20,),
                    Button(
                        textSize: 20,
                        width: 150,
                        height: 45,
                        btnText: '自動產生',
                        fn: () {},
                        bgColor: Colors.orangeAccent),
                    const SizedBox(height: 70,),
                    Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: [
                      Button(
                        textSize: 20,
                        width: 150,
                        height: 45,
                        btnText: '建立新房間',
                        fn: () {},
                        bgColor: Colors.blue),
                      Button(
                          textSize: 20,
                          width: 130,
                          height: 45,
                          btnText: '加入房間',
                          fn: () {},
                          bgColor: Colors.blue),
                    ],)
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
