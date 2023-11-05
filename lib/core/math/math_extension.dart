import 'dart:math';

extension MathExtension on double {
  double degrees(){
    return this * 180 / pi;
  }

}