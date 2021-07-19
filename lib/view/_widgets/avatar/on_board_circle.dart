import 'package:flutter/material.dart';

import '../../../core/extensions/context_extension.dart';

class OnBoardCircle extends StatelessWidget {
  final bool isSelected;

  const OnBoardCircle({Key? key, required this.isSelected}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: CircleAvatar(
        backgroundColor: context.colors.primary.withOpacity(isSelected ? 1 : .4),
        radius: isSelected ? 8 : 5,
      ),
    );
  }
}
