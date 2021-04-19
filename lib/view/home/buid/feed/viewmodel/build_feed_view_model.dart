import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/base/model/abstracts/base_view_model.dart';
import '../../../../_product/_utility/decoration_helper.dart';

part 'build_feed_view_model.g.dart';

class BuildFeedViewModel = _BuildFeedViewModelBase with _$BuildFeedViewModel;

abstract class _BuildFeedViewModelBase with Store, BaseViewModel {
  void setContext(BuildContext context) => this.context = context;
  DecorationHelper helper;
  void init() {
    helper = DecorationHelper(context: context);
  }
}
