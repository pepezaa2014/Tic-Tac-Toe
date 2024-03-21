import 'package:flutter/material.dart';
import 'package:tic_tac_toe/app/const/colors.dart';
import 'package:tic_tac_toe/app/const/player_type.dart';

class MainText extends StatelessWidget {
  MainText({required this.text});
  final String text;

  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 24,
        color: UseColors.primaryText,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class PlayerTurn extends StatelessWidget {
  PlayerTurn({required this.item});
  final PlayerType item;

  Widget build(BuildContext context) {
    final playerTurn = item.title;
    return Text(
      'Turn of ' + playerTurn,
      style: const TextStyle(
        fontSize: 16,
        color: UseColors.secondaryText,
      ),
    );
  }
}
