import 'package:flutter/material.dart';

import '../modules/home/local/one_player/one_player_controller.dart';

class Button extends StatefulWidget {
  final double width, height; //設定文字匡底線加粗背景大小
  final String btnText; //設定按鈕文字
  final Function() fn; //設定按鈕功能
  final Color bgColor;
  final double textSize;

  // final void Function(
  //     RxBool isSelected, TradingPairModel model, int index, String currency)
  // onTabCallBack;

  const Button({
    required this.width,
    required this.height,
    required this.btnText,
    required this.fn,
    required this.bgColor,
    Key? key, required this.textSize,
  }) : super(key: key);

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          //陰影
          width: widget.width,
          height: widget.height + 6,
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(90)),
          ),
        ),
        SizedBox(
          width: widget.width,
          height: widget.height,
          child: ElevatedButton(
            onPressed: widget.fn,
            style: ButtonStyle(
                padding: MaterialStateProperty.all(
                    const EdgeInsets.fromLTRB(25, 10, 25, 10)),
                backgroundColor: MaterialStateProperty.all(widget.bgColor),
                side: MaterialStateProperty.all(
                    const BorderSide(width: 1, color: Colors.black)),
                shape: MaterialStateProperty.all(const StadiumBorder(
                    side: BorderSide(style: BorderStyle.solid)))),
            child: Text(
              widget.btnText,
              style:  TextStyle(color: Colors.black, fontSize: widget.textSize),
            ),
          ),
        ),
      ],
    );
  }
}
