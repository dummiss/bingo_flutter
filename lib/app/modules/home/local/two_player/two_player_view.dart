import 'package:bingo_flutter/app/widget/button.dart';
import 'package:bingo_flutter/app/widget/input_grids.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../widget/input_grids_num_view.dart';
import 'two_player_controller.dart';

class TwoPlayerView extends GetView<TwoPlayerController> {
  const TwoPlayerView({Key? key}) : super(key: key);
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
