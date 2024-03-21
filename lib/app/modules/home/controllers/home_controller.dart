import 'package:get/get.dart';
import 'package:tic_tac_toe/app/const/player_type.dart';
import 'package:tic_tac_toe/app/utils/show_alert.dart';

class HomeController extends GetxController {
  RxInt playerScoreO = 0.obs;
  RxInt playerScoreX = 0.obs;
  final Rx<PlayerType> turn = PlayerType.O.obs;
  final RxList<PlayerType?> checkedTick =
      RxList<PlayerType?>.generate(9, (index) => null);
  bool isWin = false;
  bool isFull = false;
  int lengthWithoutNulls = 0;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setTurn(PlayerType player) {
    if (player.title == PlayerType.O.title) {
      turn.value = PlayerType.X;
    } else {
      turn.value = PlayerType.O;
    }
  }

  void addTick(int index) {
    if (isFull != true) {
      if (isWin == false) {
        if (checkedTick[index] == null) {
          checkedTick[index] = turn.value;
          checkedTick.refresh();
          checkWin();
          lengthWithoutNulls =
              checkedTick.where((element) => element != null).length;

          if (lengthWithoutNulls == 9) {
            isFull = true;
            showAlert(
              title: 'Draw!',
              onAction: resetGame,
            );
          } else {
            if (isWin) {
              if (turn.value == PlayerType.X) {
                playerScoreX++;
                showAlert(
                  title: 'Player X Win!',
                  onAction: resetGame,
                );
              } else {
                playerScoreO++;
                showAlert(
                  title: 'Player O Win!',
                  onAction: resetGame,
                );
              }
            }
          }
          setTurn(turn.value);
        }
      }
    }
  }

  void resetGame() {
    checkedTick.value = RxList<PlayerType?>.generate(9, (index) => null);
    isWin = false;
    isFull = false;
    checkedTick.refresh();
  }

  void checkWin() {
    if (lengthWithoutNulls >= 4) {
      if ((checkedTick[0] != null) &&
          (checkedTick[1] != null) &&
          (checkedTick[2] != null) &&
          (checkedTick[0] == checkedTick[1]) &&
          (checkedTick[1] == checkedTick[2])) {
        isWin = true;
      }
      if ((checkedTick[0] != null) &&
          (checkedTick[4] != null) &&
          (checkedTick[8] != null) &&
          (checkedTick[0] == checkedTick[4]) &&
          (checkedTick[4] == checkedTick[8])) {
        isWin = true;
      }
      if ((checkedTick[0] != null) &&
          (checkedTick[3] != null) &&
          (checkedTick[6] != null) &&
          (checkedTick[0] == checkedTick[3]) &&
          (checkedTick[3] == checkedTick[6])) {
        isWin = true;
      }
      if ((checkedTick[3] != null) &&
          (checkedTick[4] != null) &&
          (checkedTick[5] != null) &&
          (checkedTick[3] == checkedTick[4]) &&
          (checkedTick[4] == checkedTick[5])) {
        isWin = true;
      }
      if ((checkedTick[6] != null) &&
          (checkedTick[7] != null) &&
          (checkedTick[8] != null) &&
          (checkedTick[6] == checkedTick[7]) &&
          (checkedTick[7] == checkedTick[8])) {
        isWin = true;
      }
      if ((checkedTick[2] != null) &&
          (checkedTick[5] != null) &&
          (checkedTick[8] != null) &&
          (checkedTick[2] == checkedTick[5]) &&
          (checkedTick[5] == checkedTick[8])) {
        isWin = true;
      }
      if ((checkedTick[1] != null) &&
          (checkedTick[4] != null) &&
          (checkedTick[7] != null) &&
          (checkedTick[1] == checkedTick[4]) &&
          (checkedTick[4] == checkedTick[7])) {
        isWin = true;
      }
      if ((checkedTick[2] != null) &&
          (checkedTick[4] != null) &&
          (checkedTick[6] != null) &&
          (checkedTick[2] == checkedTick[4]) &&
          (checkedTick[4] == checkedTick[6])) {
        isWin = true;
      }
    }
  }
}
