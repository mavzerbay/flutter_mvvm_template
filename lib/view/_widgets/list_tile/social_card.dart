import 'package:flutter/material.dart';

import '../../../core/components/button/base_elevated_button.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/string_extension.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../../home/social/model/social_user_model.dart';

class SocialCard extends StatelessWidget {
  final SocialUser? user;
  final VoidCallback? onPressed;
  const SocialCard({Key? key, this.user, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(user!.image!),
      ),
      title: Text(user!.name!),
      subtitle: Text(user!.company!),
      trailing: BaseElevatedButton(
        onPressed: onPressed!,
        child: Text(LocaleKeys.home_social_follow.locale),
        color: context.theme.buttonTheme.colorScheme!.primary,
        textColor: context.theme.buttonTheme.colorScheme!.background,
      ),
    );
  }
}
