import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:tic_tac_toe/resources/resources.dart';

void main() {
  test('image_name assets test', () {
    expect(File(ImageName.blankSquareSvg).existsSync(), true);
    expect(File(ImageName.close).existsSync(), true);
    expect(File(ImageName.dryClean).existsSync(), true);
  });
}
