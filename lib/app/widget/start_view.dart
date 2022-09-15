import 'package:flutter/material.dart';
import 'package:get/get.dart';



class StartView extends StatefulWidget {
  final Color btnBgColor;
  final routeName; // Todo:Ask: 這個是放路由class，要怎麼定義型別？

  const StartView({Key? key, required this.btnBgColor, required this.routeName})
      : super(key: key);

  @override
  State<StartView> createState() => _StartViewState();
}

class _StartViewState extends State<StartView> {
  @override
  void initState() {
    super.initState();
    //自動跳轉
    //Todo:Ask: 這個還需要dispose嗎？
    Future.delayed(const Duration(milliseconds: 3000)).then((value) {
      Get.offAll(widget.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: const Center(
        child: Text(
          '遊戲開始',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
