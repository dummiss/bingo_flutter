import 'dart:async';

import 'package:bingo_flutter/app/modules/home/online/view/create_game_view.dart';
import 'package:bingo_flutter/app/widget/showAlertDialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/helper/grids_num_helper.dart';
import '../../../../core/utils/helper/line_check_helper.dart';
import '../../../data/models/game_data_model.dart';
import '../../../data/providers/providers/firebase_provider.dart';

class OnlineController extends GetxController {
  final gridsNumHelper = Get.find<GridsNumHelper>();
  final lineCheckHelper = Get.find<LineCheckHelper>();
  final fireBaseProvider = Get.find<FirebaseProvider>();

  //TODO:建立新遊戲
  late List you = [];
  late RxString gameId;
  TextEditingController yourName = TextEditingController();
  RxBool girdsState = true.obs;
  RxList gridsNumberShow = [
    [0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0],
  ].obs;
  //手動輸入檢查
  void inputNum(value, whichRow, numberIndex) {
    if (value.toString() == '') {
      gridsNumberShow[whichRow][numberIndex] = 0;
    } else {
      gridsNumberShow[whichRow][numberIndex] = int.parse(value);
      you.add(int.parse(value));
    }
  }

  //自動產生按鈕
  void randomBtnFn() {
    girdsState.value = false;
    you = gridsNumHelper.getRandomNumber();
    gridsNumberShow.value = gridsNumHelper.toTwoDimensionalArrays(you);
  }

  //建立遊戲，上傳到firebase
  //TODO:自己輸入後需轉回一維陣列存到雲端尚未寫
  Future createRoomBtnFn() async {
    if (yourName.text == '' || you == []) {
      return Get.dialog(
          const ShowAlertDialog(listBody: [Text('注意！\n請輸入名字')], btnText: 'OK'));
    } else {
      var res = gridsNumHelper.checkGridsNum(
        gridsNumber: gridsNumberShow,
        btnBgColor: Colors.grey,
      );
      if (res == true) {
        DocumentReference result = await fireBaseProvider.create({
          'data': [
            {yourName.text: you}
          ],
          'player': [yourName.text],
        });
        gameId = result.id.obs;
        girdsState.value = false;
        Get.to(() => CreateGameView(
              yourName: yourName,
              isJoin: isJoin,
              gameId: gameId,
              gameData: gameData,
            ));
      }
    }
  }

  //TODO:加入房間
  Rx<GameDataModel>? gameData;
  List? gameRead;
  TextEditingController inputGameId = TextEditingController();
  RxBool isJoin = false.obs;
  late StreamSubscription<DocumentSnapshot<Object?>> gameInfoListener;

  Future joinRoomCheckBtn({gameId}) async {
    if (gameId == '') {
      Get.dialog(const ShowAlertDialog(
          listBody: [Text('注意！\n沒有輸入房間號碼')], btnText: 'OK'));
    } else {
      //先更新資料
      fireBaseProvider.update(gameId: gameId, data: {
        'data': FieldValue.arrayUnion([
          {yourName.text: you}
        ]),
        'player': FieldValue.arrayUnion([yourName.text])
      });

      //讀取及監聽
      final Stream<DocumentSnapshot> result = fireBaseProvider.read(gameId);
      gameInfoListener = result.listen((event) {
        if (gameData == null) {
          gameData =
              GameDataModel.fromJson(event.data() as Map<String, dynamic>).obs;
        } else {
          gameData?.value =
              GameDataModel.fromJson(event.data() as Map<String, dynamic>);
        }
      });
      isJoin.value = true;
    }
  }

  gameWayChoose(String way) {
    if (way == '自選號碼') {}
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
    gameInfoListener.cancel();
    super.onClose();
  }
}

// {
// "data": {"apple":[1,2,3,4,5],"milk":[1,2,3,4,5]},
// "history": [22,3,2],
// "howToPlay": "自選號碼",
// "player": ["milk","apple"],
// "selectNum":23,
// "sequence":["milk","apple"],
// "autoSelect": ,
// "ownSelect": ,
// "winner": ""
//"isStarted":false,
//"isEnded":false,
// }
