import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

import '../../../_product/model/query/social_query/social_query.dart';
import '../model/social_user_model.dart';

abstract class ISocialService {
  final INetworkManager manager;
  final GlobalKey<ScaffoldState>? scaffoldyKey;

  ISocialService(this.manager, this.scaffoldyKey);

  Future<List<SocialUser>> fetchUserHouseList(SocialQuery query);
  Future<List<SocialUser>> fetchUserNameQuery(String text);
  Future<SocialUser?> fetchUser(id);
}
