import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/constants/image/image_constants.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/extensions/string_extension.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../viewmodel/login_view_model.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      viewModel: LoginViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, LoginViewModel value) => DefaultTabController(
        length: 2,
        child: Scaffold(
          key: value.scaffoldKey,
          body: SafeArea(
            child: Stack(
              children: [
                Positioned(
                  right: 0,
                  left: 0,
                  height: context.height * .4,
                  child: Column(
                    children: [
                      AnimatedContainer(
                        duration: context.lowDuration,
                        height: context.mediaQuery.viewInsets.bottom > 0 ? 0 : context.height * .3,
                        color: Colors.white,
                        child: Center(
                          child: Image.asset(
                            ImageConstants.instance.logo,
                            cacheHeight: (context.height * .25).round(),
                            cacheWidth: (context.height * .25).round(),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(50),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 50, right: 50, bottom: 5),
                          child: TabBar(
                            labelStyle: context.textTheme.headline5,
                            unselectedLabelStyle: context.textTheme.headline5!.copyWith(
                              color: context.buttonColors.primary.withOpacity(.3),
                            ),
                            labelColor: context.buttonColors.primary,
                            indicatorSize: TabBarIndicatorSize.label,
                            indicatorWeight: 3,
                            tabs: [
                              Tab(text: LocaleKeys.login_login.locale),
                              Tab(text: LocaleKeys.login_register.locale),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned.fill(
                  left: 0,
                  right: 0,
                  top: context.mediaQuery.viewInsets.bottom > 0 ? context.height * .2 : context.height * .4,
                  child: Center(
                    child: SingleChildScrollView(
                      child: AnimatedContainer(
                        duration: context.lowDuration,
                        height: context.mediaQuery.viewInsets.bottom > 0 ? context.height * .8 : context.height * .6,
                        padding: context.paddingMedium,
                        child: buildForm(value, context),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Form buildForm(LoginViewModel value, BuildContext context) {
    return Form(
      key: value.formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          context.mediaQuery.viewInsets.bottom > 0 ? SizedBox(height: 0) : Spacer(flex: 6),
          buildTextFormFieldEmail(context, value),
          buildTextFormFieldPassword(context, value),
          SizedBox(height: context.normalValue),
          buildForgotButton(),
          SizedBox(height: context.normalValue),
          buildElevatedButtonLogin(context, value),
          buildBottomRegister(context),
          Spacer(),
        ],
      ),
    );
  }

  Widget buildTextFormFieldPassword(BuildContext context, LoginViewModel viewModel) {
    return Observer(
      builder: (_) {
        return TextFormField(
          controller: viewModel.passwordTEC,
          validator: (value) => value!.isNotEmpty ? null : LocaleKeys.login_password_required.locale,
          obscureText: !viewModel.isLockOpen,
          decoration: InputDecoration(
            labelText: LocaleKeys.login_password.locale,
            icon: buildContainerIconField(context, Icons.vpn_key_sharp),
            suffixIcon: TextButton(
              style: ButtonStyle(padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero)),
              child: Observer(
                builder: (_) {
                  return Icon(viewModel.isLockOpen ? Icons.lock_open_rounded : Icons.lock_rounded);
                },
              ),
              onPressed: () {
                viewModel.isLockStateChange();
              },
            ),
          ),
        );
      },
    );
  }

  TextFormField buildTextFormFieldEmail(BuildContext context, LoginViewModel viewModel) {
    return TextFormField(
      controller: viewModel.emailTEC,
      keyboardType: TextInputType.emailAddress,
      validator: (value) => value!.isValidEmail,
      decoration: InputDecoration(
        labelText: LocaleKeys.login_email.locale,
        icon: buildContainerIconField(context, Icons.email),
      ),
    );
  }

  Container buildContainerIconField(BuildContext context, IconData icon) {
    return Container(
      padding: context.paddingLow,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: context.colors.primary,
      ),
      child: Icon(icon, color: context.colors.primaryVariant),
    );
  }

  Align buildForgotButton() => Align(
        alignment: Alignment.centerRight,
        child: Text(LocaleKeys.login_forgot_your_password.locale),
      );

  Widget buildElevatedButtonLogin(BuildContext context, LoginViewModel viewModel) {
    return Observer(builder: (_) {
      return ElevatedButton(
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(context.paddingNormal),
            foregroundColor: MaterialStateProperty.all<Color>(context.colors.primaryVariant),
            shape: MaterialStateProperty.all<OutlinedBorder>(StadiumBorder())),
        onPressed: viewModel.isLoading
            ? null
            : () {
                viewModel.fetchLoginService();
              },
        child: Center(
          child: viewModel.isLoading
              ? CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(context.colors.primaryVariant),
                )
              : Text(
                  LocaleKeys.login_login.locale,
                  style: context.textTheme.headline5!.copyWith(color: context.colors.primaryVariant),
                ),
        ),
      );
    });
  }

  Padding buildBottomRegister(BuildContext context) {
    return Padding(
      padding: context.paddingNormalVertical,
      child: Wrap(
        children: [
          Text(LocaleKeys.login_you_dont_have_account.locale),
          GestureDetector(
            onTap: () {
              print("Kayıt Ol basıldı");
            },
            child: Text(LocaleKeys.login_register.locale),
          ),
        ],
      ),
    );
  }
}
