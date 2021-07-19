import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import '../../home/social/view/social_view_detail.dart';

import '../../home/social/model/social_user_model.dart';

class OpenContainerSocialWrapper extends StatelessWidget {
  final ContainerTransitionType _transitionType = ContainerTransitionType.fade;
  final OpenContainerBuilder? closedBuilder;
  final ClosedCallback<bool?>? onClosed;
  final SocialUser? socialUser;

  const OpenContainerSocialWrapper({
    this.closedBuilder,
    this.onClosed,
    this.socialUser,
  });

  @override
  Widget build(BuildContext context) {
    return OpenContainer<bool>(
      closedBuilder: closedBuilder as Widget Function(BuildContext, void Function()),
      openBuilder: (BuildContext context, VoidCallback _) {
        return SocialUserViewDetail(
          socialUser: socialUser,
        );
      },
      onClosed: onClosed,
      tappable: false,
      transitionType: _transitionType,
    );
  }
}
