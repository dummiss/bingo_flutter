import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/widget/showAlertDialog.dart';

class GridsNumHelper {
  //隨機25個數字
  List<int> getRandomNumber() {
    List<int> tmp = [], result = [];

    for (int i = 1; i < 26; i++) {
      tmp.add(i);
    }
    for (int i = 0; i < 25; i++) {
      int randomNumber = Random().nextInt(tmp.length);
      result.add(tmp[randomNumber]);
      tmp.removeAt(randomNumber);
    }
    return result;
  }

  //轉成二維陣列
  List<List<int>> toTwoDimensionalArrays(List numbers) {
    List<List<int>> result = [];
    List<int> tmp = [];
    for (int i = 0; i < 25; i++) {
      if ((i + 1) % 5 > 0) {
        //判斷是否為五的倍數
        tmp.add(numbers[i]);
      } else {
        tmp.add(numbers[i]);
        result.add(tmp);
        tmp = [];
      }
    }
    return result;
  }

  //檢查grids裡的數字是否符合規則
  //TODO: Ask: 如果我的判斷裡包含有回傳widget和無回傳widget，我要如何定義型態？ ex:在下面的checkGridsNum前
  checkGridsNum({required gridsNumber, required btnBgColor}) {
    int nullCheck = 0;
    int numSizeCheck = 0;
    int repeatCheck = 0;
    List<int> check = [];

    for (int i = 0; i < 5; i++) {
      for (int j = 0; j < 5; j++) {
        if (gridsNumber[i][j] == 0) {
          nullCheck++;
        }
        if (gridsNumber[i][j] > 25 || gridsNumber[i][j] < 0) {
          numSizeCheck++;
        }
        if (check.contains(gridsNumber[i][j])) {
          repeatCheck++;
        }
        check.add(gridsNumber[i][j]);
      }
    }
    if (nullCheck > 0 || numSizeCheck > 0 || repeatCheck > 0) {
      return Get.dialog(ShowAlertDialog(
        listBody: [
          const Text('請檢查！'),
          (nullCheck > 0)
              ? const Text('有格子尚未被填入數字')
              : (numSizeCheck > 0)
                  ? const Text('有格子數字 >26 或 <1')
                  : (repeatCheck > 0)
                      ? const Text('有格子數字 重複！')
                      : const Text(''),
        ],
        btnText: 'OK',
      ));
    } else {
      return true;
    }
  }
}
