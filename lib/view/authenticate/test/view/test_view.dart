import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttermvvmtemplate/core/extensions/context_extension.dart';

import '../../../../core/base/state/base_state.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../core/constants/enums/locale_preferences_keys_enum.dart';
import '../../../../core/extensions/string_extension.dart';
import '../../../../core/init/cache/locale_manager.dart';
import '../../../../core/init/lang/language_manager.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../viewmodel/test_view_model.dart';

class TestsView extends StatefulWidget {
  @override
  _TestsViewState createState() => _TestsViewState();
}

class _TestsViewState extends BaseState<TestsView> {
  TestViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView<TestViewModel>(
      viewModel: TestViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        viewModel = model;
      },
      onPageBuilder: (context, value) => scaffoldBody,
    );
  }

  Widget get scaffoldBody => Scaffold(
        appBar: appBar(),
        floatingActionButton: floatingActionButtonNumberIncrement,
        body: textNumber,
      );

  AppBar appBar() {
    return AppBar(
      leading: Text(
        LocaleManager.instance.getStringValue(LocalePreferencesKeys.TOKEN),
      ),
      centerTitle: true,
      title: textWelcomeWidget(),
      actions: [
        iconButtonChangeTheme(),
      ],
    );
  }

  IconButton iconButtonChangeTheme() {
    return IconButton(
      icon: Icon(Icons.change_history),
      onPressed: () {
        if (context.locale == LanguageManager.instance.enLocale) {
          context.locale = LanguageManager.instance.trLocale;
        } else {
          context.locale = LanguageManager.instance.enLocale;
        }
      },
    );
  }

  Text textWelcomeWidget() => Text(LocaleKeys.welcome.locale);

  Widget get textNumber {
    return Center(
      child: Observer(
        builder: (context) => Text(
          viewModel.number.toString(),
          style: context.textTheme.subtitle1.copyWith(fontSize: context.highValue),
        ),
      ),
    );
  }

  FloatingActionButton get floatingActionButtonNumberIncrement {
    return FloatingActionButton(
      onPressed: () => viewModel.incrementNumber(),
      child: Icon(Icons.add, size: context.mediumValue),
    );
  }
}

extension _FormArea on _TestsViewState {
  TextFormField get mailField => TextFormField(
        validator: (value) => value.isValidEmail,
      );
}
