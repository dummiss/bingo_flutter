import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'online_controller.dart';

class OnlineView extends GetView<OnlineController> {
  const OnlineView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OnlineView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'OnlineView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
