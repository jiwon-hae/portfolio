import 'package:flutter/cupertino.dart';

class Gaps extends StatelessWidget {
  const Gaps._({this.height = 0, this.width = 0});

  factory Gaps.vertical(double height) {
    return Gaps._(height: height);
  }

  factory Gaps.horizontal(double width){
    return Gaps._(width : width);
  }

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width : width, height : height);
  }
}
