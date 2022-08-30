import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'join_game_controller.dart';

class JoinGameView extends GetView<JoinGameController> {
  const JoinGameView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
