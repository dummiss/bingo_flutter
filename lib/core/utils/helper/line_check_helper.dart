import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/widget/result_view.dart';

class LineCheckHelper {
  int BIN = 5;
  int s = 0;
  int k = 0;

  check({
    required List numList,
    required String name,
    required Color btnBgColor,
    required RxList pcGridsNumberShow,
    required RxList gridsNumberShow,
    required RxBool girdsState,
    required RxList history,
    required Function inputNum,
  }) {
    s = 0;
    k = 0;
    //橫
    for (int i = 0; i < BIN; i++) {
      for (int j = 0; j < BIN; j++) {
        s += numList[i][j] as int;
      }
      if (s == 0) k += 1;
      s = 0;
    }

    //縱
    for (int j = 0; j < BIN; j++) {
      for (int i = 0; i < BIN; i++) {
        s += numList[i][j] as int;
      }
      if (s == 0) k += 1;
      s = 0;
    }

    //斜
    for (int i = 0; i < BIN; i++) {
      s += numList[i][i] as int;
    }
    if (s == 0) k += 1;
    s = 0;

    for (int i = BIN - 1; i >= 0; i--) {
      int j = BIN - (i + 1);
      s += numList[i][j] as int;
    }
    if (s == 0) k += 1;
    s = 0;

    if (k >= 1) {
      debugPrint("連線數=$k,BINGO!\n");
      Get.off(() => ResultView(
            btnBgColor: btnBgColor,
            result: '$name 贏了',
            inputNum: inputNum,
            pcGridsNumberShow: pcGridsNumberShow,
            gridsNumberShow: gridsNumberShow,
            girdsState: girdsState,
            history: history,
          ));

      return name;
    } else {
      debugPrint("連線數=$k,GAME LOST!\n");
      return '';
    }
  }
}
