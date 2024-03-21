import 'package:tic_tac_toe/resources/resources.dart';

enum PlayerType {
  X,
  O,
}

extension SortTypeExtension on PlayerType {
  String get title {
    switch (this) {
      case PlayerType.O:
        return 'O';
      case PlayerType.X:
        return 'X';
    }
  }

  String get Image {
    switch (this) {
      case PlayerType.X:
        return ImageName.close;
      case PlayerType.O:
        return ImageName.dryClean;
    }
  }
}
