import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'two_player_controller.dart';

class TwoPlayerView extends GetView<TwoPlayerController> {
  const TwoPlayerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TwoPlayerView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'TwoPlayerView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
