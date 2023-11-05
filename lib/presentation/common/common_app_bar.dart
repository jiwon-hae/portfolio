import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget {
  const CommonAppBar({super.key, this.leading, this.actions});

  factory CommonAppBar.leading({required Widget leading}){
    return CommonAppBar(leading : leading);
  }

  factory CommonAppBar.trailing({required List<Widget> actions}){
    return CommonAppBar(actions : actions);
  }

  factory CommonAppBar.build({Widget? leading, List<Widget>? actions}){
    return CommonAppBar(leading : leading, actions : actions);
  }

  final List<Widget>? actions;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading : leading,
      actions: actions,
    );
  }
}
