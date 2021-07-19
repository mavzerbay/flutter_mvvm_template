import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

import '../../../../_product/_utility/service_helper.dart';
import '../../../../_product/enum/network_route_enum.dart';
import '../model/house_model.dart';
import 'build_feed_service_interface.dart';

class BuildFeedService extends IBuildFeedService with ServiceHelper {
  BuildFeedService(INetworkManager manager, GlobalKey<ScaffoldState> key) : super(manager, key);

  @override
  Future<List<HouseModel>?> fetchUserHouseList() async {
    final response =
        await manager.send<HouseModel, List<HouseModel>>(NetworkRoutes.BUILD_HOME.rawValue, parseModel: HouseModel(), method: RequestType.GET);

    showMessage(scaffoldKey, response.error);
    return response.data;
  }
}
