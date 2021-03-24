import 'package:flutter/material.dart';

import '../../../core/components/button/icon_button.dart';

class MavLoginButton extends StatelessWidget {
  final Function(String data) onComplete;

  const MavLoginButton({Key key, this.onComplete}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MavIconButton(
      icon: Icons.search,
      onPressed: (){
        onComplete("login button clicked");
      },
    );
  }
}
