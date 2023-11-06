import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/precondition.dart';

class PortfolioPickerItem extends StatelessWidget {
  const PortfolioPickerItem({super.key, required this.label, this.leading, this.trailing});

  final String label;
  final Widget? leading;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Precondition.checkNotNull(leading) ? leading! : Container(),
        Text(label, style : const TextStyle(fontSize : 20, color : Colors.black)),
        Precondition.checkNotNull(trailing) ? trailing! : Container(),
      ],
    );
  }
}
