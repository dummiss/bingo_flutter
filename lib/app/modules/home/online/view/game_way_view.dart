import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../widget/button.dart';

class GameWayView extends StatefulWidget {
  const GameWayView({Key? key}) : super(key: key);

  @override
  State<GameWayView> createState() => _GameWayViewState();
}

class _GameWayViewState extends State<GameWayView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('遊戲玩法'),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          height: 450,
          child: Column(
            children: [
              const Text(
                '請選擇玩法',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Button(
                      textSize: 20,
                      width: 150,
                      height: 45,
                      btnText: '自選號碼',
                      fn: () {},
                      bgColor: Colors.orangeAccent),
                  const SizedBox(
                    width: 15,
                  ),
                  const Text('5票'),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Button(
                      textSize: 20,
                      width: 150,
                      height: 45,
                      btnText: '電腦叫號',
                      fn: () {},
                      bgColor: Colors.orangeAccent),
                  const SizedBox(
                    width: 15,
                  ),
                  const Text('1票'),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              const Text(
                '尚有1人未選',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 50),
              const Text(
                '遊戲即將開始',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.red),
              ),
              const Text(
                '0',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
