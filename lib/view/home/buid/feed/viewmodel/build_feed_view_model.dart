import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/base/model/abstracts/base_view_model.dart';
import '../../../../_product/_utility/decoration_helper.dart';
import '../model/house_model.dart';
import '../service/build_feed_service.dart';
import '../service/build_feed_service_interface.dart';

part 'build_feed_view_model.g.dart';

class BuildFeedViewModel = _BuildFeedViewModelBase with _$BuildFeedViewModel;

abstract class _BuildFeedViewModelBase with Store, BaseViewModel {
  void setContext(BuildContext context) => this.context = context;

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  DecorationHelper helper;
  IBuildFeedService feedService;

  @observable
  List<HouseModel> houseModel = [];

  @computed
  HouseModel get sliderHouse => houseModel.first;

  @observable
  bool isLoading = false;

  void init() {
    helper = DecorationHelper(context: context);
    feedService = BuildFeedService(vexanaManager.networkManager, scaffoldKey);
  }

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  @action
  Future<void> getListAll() async {
    houseModel = await feedService.fetchUserHouseList();
  }
}
