import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

import '../../../_product/_utility/service_helper.dart';
import '../../../_product/enum/network_route_enum.dart';
import '../../../_product/model/query/social_query/social_query.dart';
import '../../../_product/model/query/social_query/social_query_enum.dart';
import '../model/social_user_model.dart';
import 'social_service_interface.dart';

class SocialService extends ISocialService with ServiceHelper {
  SocialService(INetworkManager manager, GlobalKey<ScaffoldState>? scaffoldyKey) : super(manager, scaffoldyKey);

  @override
  Future<SocialUser?> fetchUser(id) async {
    final response = await manager.send<SocialUser, SocialUser>(NetworkRoutes.SOCIAL_ALL.rawValue,
        parseModel: SocialUser(), urlSuffix: '/$id', method: RequestType.GET);
    showMessage(scaffoldyKey, response.error);
    return response.data;
  }

  @override
  Future<List<SocialUser>> fetchUserHouseList(SocialQuery query) async {
    final response = await manager.send<SocialUser, List<SocialUser>>(NetworkRoutes.SOCIAL_ALL.rawValue,
        parseModel: SocialUser(),
        queryParameters: {SocialQueryEnum.LIMIT.rawValue: query.limit, SocialQueryEnum.Q.rawValue: query.q},
        method: RequestType.GET);
    showMessage(scaffoldyKey, response.error);
    return response.data ?? [];
  }

  @override
  Future<List<SocialUser>> fetchUserNameQuery(String text) {
    // TODO: implement fetchUserNameQuery
    throw UnimplementedError();
  }
}
