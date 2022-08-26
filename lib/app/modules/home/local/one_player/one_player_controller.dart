import 'package:bingo_flutter/app/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/helper/grids_num_helper.dart';
import '../../../../../app/widget/showAlertDialog.dart';

class OnePlayerController extends GetxController {
  final gridsNumHelper = Get.find<GridsNumHelper>();
  RxBool girdsState = true.obs; //隨機按鈕切換狀態
  RxString errorMS = ''.obs;

  RxList gridsNumber = [
    [0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0],
  ].obs;

  test(value, whichRow, numberIndex) {
    if (value.toString() == '') {
      gridsNumber[whichRow][numberIndex] = 0;
      errorMS.value = '';
    } else {
      gridsNumber[whichRow][numberIndex] = int.parse(value);
    }
    if (int.parse(value) > 25 || int.parse(value) < 0) {
      errorMS.value = '注意：有格子數字 >26 或 <1';
    }
  }

  void randomBtnFn() {
    girdsState.value = false;
    List<int> res = gridsNumHelper.getRandomNumber();
    gridsNumber.value = gridsNumHelper.toTwoDimensionalArrays(res);
  }

  //TODO:按下next後：判斷是否已經沒有為0,數字是否重複,只能是數字的報錯

  nextBtnFn({required btnBgColor, required controller}) {
    //check
    gridsNumHelper.checkGridsNum(
        gridsNumber: gridsNumber,
        btnBgColor: btnBgColor,
        controller: controller);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
