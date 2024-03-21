import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tic_tac_toe/app/modules/home/widgets/text.dart';

import '../controllers/home_controller.dart';
import 'package:tic_tac_toe/app/modules/home/widgets/widgets.dart';
import 'package:tic_tac_toe/app/const/colors.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UseColors.themeApp,
      appBar: AppBar(
        backgroundColor: UseColors.themeApp,
        title: const Text('Tic Tac Toe'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: controller.resetGame,
            icon: const Icon(Icons.refresh),
            color: Colors.white,
          )
        ],
      ),
      body: _body(),
    );
  }

  _body() {
    return Obx(
      () {
        return Center(
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: PlayerScore(
                        name: 'Player O',
                        score: controller.playerScoreO.value,
                      ),
                    ),
                    Expanded(
                      child: PlayerScore(
                        name: 'Player X',
                        score: controller.playerScoreX.value,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: TicTacToeCells(
                  item: controller.turn.value,
                  checkTick: controller.checkedTick.value,
                  addTick: controller.addTick,
                ),
              ),
              Expanded(
                child: PlayerTurn(
                  item: controller.turn.value,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
