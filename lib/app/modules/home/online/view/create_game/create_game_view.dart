
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'create_game_controller.dart';




class CreateGameView extends GetView<CreateGameController> {
  const CreateGameView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      appBar: AppBar(
        title: const Text('OnlineView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'OnlineView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
