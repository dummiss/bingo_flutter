import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'button.dart';

class ShowAlertDialog extends StatefulWidget {
  final List<Widget> listBody;
  final String btnText;
  const ShowAlertDialog({Key? key, required this.listBody, required this.btnText}) : super(key: key);

  @override
  State<ShowAlertDialog> createState() => _ShowAlertDialogState();
}

class _ShowAlertDialogState extends State<ShowAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
          child: ListBody(
        children: widget.listBody,
      )),
      actions: <Widget>[
        Button(
            textSize: 16,
            width: 80,
            height: 40,
            btnText: widget.btnText,
            fn: () {
              Get.back();
            },
            bgColor: Colors.red.shade200)
      ],
    );
  }
}
