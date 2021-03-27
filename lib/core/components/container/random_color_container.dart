import 'package:flutter/material.dart';

import '../../extensions/context_extension.dart';

class RandomColorContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.randomColor,
    );
  }
}
