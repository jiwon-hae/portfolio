import 'package:flutter/cupertino.dart';

extension WidgetExtension on Widget {
  Widget paddingWith(EdgeInsets padding){
    return Padding(
      padding: padding,
      child : this
    );
  }
}