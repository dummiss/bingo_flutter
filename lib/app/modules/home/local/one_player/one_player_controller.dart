import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/helper/grids_num_helper.dart';
import '../../../../../core/utils/helper/line_check_helper.dart';
import '../../../../data/providers/providers/firebase_provider.dart';
import '../../../../widget/showAlertDialog.dart';

class OnePlayerController extends GetxController {
  final gridsNumHelper = Get.find<GridsNumHelper>();
  final lineCheckHelper = Get.find<LineCheckHelper>();
  final fireBaseProvider = Get.find<FirebaseProvider>();
  late DocumentReference<Map<String, dynamic>> result;
  RxString gameId = ''.obs;

  RxBool girdsState = true.obs; //隨機按鈕切換狀態
  RxString errorMS = ''.obs;

  final RxList history = [].obs;
  final String howToPlay = ''; //用enum
  final List player = ['you', 'pc'];
  final List sequence = [];
  final String winner = '';
  RxInt selectNum = 0.obs;
  late List random25NumForPcSelect = gridsNumHelper.getRandomNumber(); //電腦叫號的號碼

  //上傳到firebase用＋判斷連線用
  late List you = [];
  late List pc = gridsNumHelper.getRandomNumber();
  //畫面用
  late RxList pcGridsNumberShow = gridsNumHelper.toTwoDimensionalArrays(pc).obs;
  RxList gridsNumberShow = [
    [0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0],
  ].obs;

  void inputNum(value, whichRow, numberIndex) {
    if (value.toString() == '') {
      gridsNumberShow[whichRow][numberIndex] = 0;
      errorMS.value = '';
    } else {
      gridsNumberShow[whichRow][numberIndex] = int.parse(value);
      you.add(value);
    }
    //TODO: 這裡用tryParse，錯誤會回傳ｎｕｌｌ
    if (int.parse(value) > 25 || int.parse(value) < 0) {
      errorMS.value = '注意：有格子數字 >26 或 <1';
    }
  }

  void randomBtnFn() {
    girdsState.value = false;
    errorMS.value = '';
    you = gridsNumHelper.getRandomNumber();
    gridsNumberShow.value = gridsNumHelper.toTwoDimensionalArrays(you);
  }

  //25個數字輸入的檢查
  nextBtnFn({required btnBgColor}) {
    var res = gridsNumHelper.checkGridsNum(
        gridsNumber: gridsNumberShow, btnBgColor: btnBgColor);
    return res;
  }

  //建立遊戲，上傳到firebase
  Future createGame(String gameWay) async {
    player.shuffle(); //打亂順序
    result = await fireBaseProvider.create({
      'data': {'you': you, 'pc': pc},
      'history': history,
      'howToPlay': gameWay,
      'player': ['you', 'pc'],
      'selectNum': selectNum.value,
      'sequence': player,
      'winner': winner
    });
    gameId.value = result.id;
  }

  //電腦叫號：依序回傳List裡的號碼，目的為了不重複
  RxInt selectNumByRandom() {
    selectNum.value = random25NumForPcSelect[0];
    random25NumForPcSelect.removeAt(0);
    debugPrint('random25NumForPcSelect:$random25NumForPcSelect');
    return selectNum;
  }

  gameStartNextBtnFn(String number, Color btnBgColor) {
    if (number == '') {
      Get.dialog(const ShowAlertDialog(
          listBody: [Text('注意！\n沒有輸入號碼')], btnText: 'OK'));
    } else {
      String winner = '';
      selectNum.value = int.parse(number);
      history.add(selectNum.value);
      debugPrint('history:$history');

      //檢查連線數
      for (int i = 0; i < 25; i++) {
        if (pc[i] == selectNum.value) {
          pc[i] = 0;
          winner = lineCheckHelper.check(
              numList: pcGridsNumberShow,
              name: '電腦',
              btnBgColor: btnBgColor,
              girdsState: girdsState,
              history: history,
              inputNum: inputNum,
              pcGridsNumberShow: pcGridsNumberShow,
              gridsNumberShow: gridsNumberShow);
        }
        if (you[i] == selectNum.value) {
          you[i] = 0;
          winner = lineCheckHelper.check(
              numList: gridsNumHelper.toTwoDimensionalArrays(you),
              name: '玩家',
              btnBgColor: btnBgColor,
              girdsState: girdsState,
              history: history,
              inputNum: inputNum,
              pcGridsNumberShow: pcGridsNumberShow,
              gridsNumberShow: gridsNumberShow);
        }
      }
      //檢查完後更新firebase
      fireBaseProvider.update(gameId: gameId.string, data: {
        "history": history,
        "selectNum": selectNum.value,
        "winner": winner,
      });
      debugPrint('selectNum:$selectNum');
      debugPrint('pc:$pc');
      debugPrint('you:$you');
    }
  }
}

// {
// "data": {"apple":[1,2,3,4,5],"milk":[1,2,3,4,5]},
// "history": [22,3,2],
// "howToPlay": "自選號碼",
// "player": ["milk","apple"],
// "selectNum":23,
// "sequence":["milk","apple"],
// "winner": ""
// }
