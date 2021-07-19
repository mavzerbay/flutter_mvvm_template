import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/abstracts/base_view_model.dart';
import '../../../_product/_utility/throttle_helper.dart';
import '../../../_product/model/query/social_query/social_query.dart';
import '../model/social_user_model.dart';
import '../service/social_service_interface.dart';

part 'social_view_model.g.dart';

class SocialViewModel = _SocialViewModelBase with _$SocialViewModel;

abstract class _SocialViewModelBase with Store, BaseViewModel {
  final ISocialService _socialService;
  int _page = 0;
  String? _query = '';
  bool isLazyLoadFinish = false;

  TextEditingController searchTEC = TextEditingController();

  late ThrottleStringHelper _throttleStringHelper;

  @observable
  List<SocialUser> socialUserList = [];
  @observable
  bool isPageLoading = false;
  @observable
  bool isPageLoadingLazy = false;

  @override
  void setContext(BuildContext context) => this.context = context;

  _SocialViewModelBase(this._socialService);

  @override
  void init() {
    _throttleStringHelper = ThrottleStringHelper();
    _fetchAllUser();
  }

  @action
  Future<void> _fetchAllUser() async {
    _changeLoading();
    final response = await _socialService.fetchUserHouseList(SocialQuery());
    socialUserList = response;
    _changeLoading();
  }

  @action
  Future<void> fetchAllUserLazy(int index) async {
    if (isPageLoadingLazy || index != socialUserList.length - 1 || isLazyLoadFinish) return;
    _changeLoadingLazy();

    final response = await _socialService.fetchUserHouseList(SocialQuery(limit: _page + 1, q: _query));
    if (response.isNotEmpty) {
      if (socialUserList.isEmpty) {
        socialUserList = response;
      } else if (response.last.id != socialUserList.last.id) {
        socialUserList.addAll(response);
        socialUserList = socialUserList;
      }
      _page++;
    } else {
      isLazyLoadFinish = true;
    }

    _changeLoadingLazy();
  }

  @action
  void fetchAllSearchQuery() {
    String text = searchTEC.text;
    _throttleStringHelper.onDelayTouch(text, (text) async {
      if (_query!.isEmpty) {
        _page = -1;
      }
      _query = text;
      isLazyLoadFinish = false;
      socialUserList = [];
      await fetchAllUserLazy(socialUserList.length - 1);
    });
  }

  @action
  void _changeLoading() {
    isPageLoading = !isPageLoading;
  }

  @action
  void _changeLoadingLazy() {
    isPageLoadingLazy = !isPageLoadingLazy;
  }
}
