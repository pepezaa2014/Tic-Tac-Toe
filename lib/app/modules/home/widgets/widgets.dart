import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tic_tac_toe/app/const/colors.dart';
import 'package:tic_tac_toe/app/const/player_type.dart';
import 'package:tic_tac_toe/app/modules/home/widgets/text.dart';
import 'package:tic_tac_toe/resources/resources.dart';

class PlayerScore extends StatelessWidget {
  PlayerScore({
    required this.name,
    required this.score,
  });

  final String name;
  final int score;

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Column(
          children: [
            MainText(
              text: name,
            ),
            const Divider(
              color: UseColors.themeApp,
            ),
            MainText(
              text: score.toString(),
            ),
          ],
        ),
      ),
    );
  }
}

class TicTacToeCells extends StatelessWidget {
  TicTacToeCells({
    required this.addTick,
    required this.item,
    required this.checkTick,
  });

  final Function(int) addTick;
  final PlayerType item;
  final List<PlayerType?> checkTick;

  Widget build(BuildContext context) {
    return Center(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1,
          crossAxisCount: 3,
        ),
        itemCount: 9,
        itemBuilder: (BuildContext context, index) {
          print(checkTick);
          return GestureDetector(
            onTap: () => addTick(index),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: UseColors.themeApp,
                border: Border.all(
                  color: Colors.white,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: checkTick[index]?.Image != null
                    ? Image.asset(
                        checkTick[index]!.Image,
                        color: Colors.white,
                      )
                    : Container(),
              ),
            ),
          );
        },
      ),
    );
  }
}
