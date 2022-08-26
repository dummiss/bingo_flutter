import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'local_controller.dart';

class LocalView extends GetView<LocalController> {
  const LocalView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LocalView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'LocalView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
