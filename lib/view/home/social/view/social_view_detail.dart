import 'package:flutter/material.dart';
import '../../../../core/extensions/future_extension.dart';
import 'package:vexana/vexana.dart';

import '../../../../core/init/network/vexana_manager.dart';
import '../model/social_user_model.dart';
import '../service/social_service.dart';
import '../service/social_service_interface.dart';

class SocialUserViewDetail extends StatelessWidget {
  final SocialUser? socialUser;

  final INetworkManager manager = VexanaManager.instance.networkManager;

  ISocialService get socialService => SocialService(manager, null);

  SocialUserViewDetail({
    Key? key,
    this.socialUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: socialService.fetchUser(socialUser!.id).toBuild<SocialUser>(
          onSuccess: (data) {
            return Center(child: Image.network(data!.image!));
          },
          loadingWidget: CircularProgressIndicator(),
          notFoundWidget: Center(
            child: Text('Not Found'),
          ),
          onError: Text('error')),
    );
  }
}
