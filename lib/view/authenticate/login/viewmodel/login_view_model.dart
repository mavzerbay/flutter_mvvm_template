import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/abstracts/base_view_model.dart';

part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store,BaseViewModel {
  void setContext(BuildContext context) => this.context = context;
  void init() {}
}
