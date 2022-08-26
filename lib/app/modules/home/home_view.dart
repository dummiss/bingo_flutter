import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../routes/app_pages.dart';
import '../../widget/button.dart';
import '../../widget/choose_view.dart';
import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const colorizeColors = [
      Colors.red,
      Colors.blue,
      Colors.yellow,
      Colors.purple,
    ];

    return Scaffold(
        appBar: AppBar(
          title: const Text('賓果遊戲'),
          centerTitle: true,
        ),
        body: Center(
          child: SizedBox(
            width: 500,
            height: 400,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 400.0,
                  child: AnimatedTextKit(
                    //標題＆動畫
                    animatedTexts: [
                      ColorizeAnimatedText(
                        'Bingo Game',
                        textStyle: GoogleFonts.russoOne(
                            fontSize: 50, fontWeight: FontWeight.w900),
                        colors: colorizeColors,
                      ),
                    ],
                    isRepeatingAnimation: true,
                    onTap: () {
                      print("Tap Event");
                    },
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Button(
                    textSize: 20,
                    width: 150,
                    height: 60,
                    btnText: '1 player',
                    bgColor: Colors.red.shade200,
                    fn: () {
                      Get.toNamed(Routes.ONE_PLAYER);
                    }),
                const SizedBox(
                  height: 20,
                ),
                Button(
                    textSize: 20,
                    width: 150,
                    height: 60,
                    btnText: '2 player',
                    bgColor: Colors.green.shade200,
                    fn: () {
                      Get.to(ChooseView(btnBgColor: Colors.red.shade200,controller:controller,));
                    }),
                const SizedBox(
                  height: 20,
                ),
                Button(
                    textSize: 20,
                    width: 150,
                    height: 60,
                    btnText: 'online PK',
                    bgColor: Colors.grey,
                    fn: () {
                      debugPrint('online Pk');
                    }),
                // InputGrids(newGame: false)
              ],
            ),
          ),
        ));
  }
}
