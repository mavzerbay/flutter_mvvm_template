import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/abstracts/base_view_model.dart';
import '../../../../core/constants/enums/locale_preferences_keys_enum.dart';
import '../../../../core/constants/navigation/navigation_constants.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../_product/_constants/image_path_svg.dart';
import '../model/on_board_model.dart';

part 'on_board_view_model.g.dart';

class OnBoardViewModel = _OnBoardViewModelBase with _$OnBoardViewModel;

abstract class _OnBoardViewModelBase with Store, BaseViewModel {
  void setContext(BuildContext context) => this.context = context;
  List<OnBoardModel> onBoardModel = [];

  @observable
  int currentPageIndex = 0;

  @observable
  bool isLoading = false;

  @action
  void onPageChanged(int index) {
    currentPageIndex = index;
  }

  void init() {
    onBoardModel.add(OnBoardModel(
      LocaleKeys.onBoard_page1_title,
      LocaleKeys.onBoard_page1_desc,
      SVGImagePaths.instance.ideation,
    ));
    onBoardModel.add(OnBoardModel(
      LocaleKeys.onBoard_page2_title,
      LocaleKeys.onBoard_page2_desc,
      SVGImagePaths.instance.hiking,
    ));
    onBoardModel.add(OnBoardModel(
      LocaleKeys.onBoard_page3_title,
      LocaleKeys.onBoard_page3_desc,
      SVGImagePaths.instance.mobile,
    ));
  }

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  Future<void> completeToOnBoard() async {
    changeLoading();
    await localeManager.setBoolValue(LocalePreferencesKeys.IS_FIRST_APP, true);
    changeLoading();
    navigation.navigateToPage(path: NavigationConstants.LOGIN_VIEW);
  }
}
