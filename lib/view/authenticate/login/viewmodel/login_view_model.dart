import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/abstracts/base_view_model.dart';
import '../../../../core/constants/enums/locale_preferences_keys_enum.dart';
import '../../../../core/init/network/vexana_manager.dart';
import '../model/login_model.dart';
import '../services/login_service.dart';
import '../services/login_service_interface.dart';

part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store, BaseViewModel {
  GlobalKey<FormState> formKey = GlobalKey();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  ILoginService loginService;

  TextEditingController emailTEC;
  TextEditingController passwordTEC;

  void setContext(BuildContext context) => this.context = context;
  void init() {
    loginService = LoginService(VexanaManager.instance.networkManager);
    emailTEC = TextEditingController();
    passwordTEC = TextEditingController();
  }

  @observable
  bool isLoading = false;

  @observable
  bool isLockOpen = false;

  @action
  Future<void> fetchLoginService() async {
    isLoadingStateChange();
    if (formKey.currentState.validate()) {
      final response = await loginService.fetchUserControl(
        LoginModel(email: emailTEC.text, password: passwordTEC.text),
      );

      if (response != null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(response.token),
        ));
        localeManager.setStringValue(LocalePreferencesKeys.TOKEN, response.token);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Login Error"),
        ));
      }
    }
    isLoadingStateChange();
  }

  @action
  void isLoadingStateChange() {
    isLoading = !isLoading;
  }

  @action
  void isLockStateChange() {
    isLockOpen = !isLockOpen;
  }
}
