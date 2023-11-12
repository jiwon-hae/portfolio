import 'dart:math';

extension MathExtension on double {
  double rad2deg(){
    return this * (180 / pi);
  }

  double deg2rad(){
    return this * (pi / 180);
  }
}