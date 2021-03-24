import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/components/column/form_column.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../_widgets/list_view/on_board_indicator.dart';
import '../view_model/on_board_view_model.dart';

class OnBoardView extends StatefulWidget {
  OnBoardView({Key key}) : super(key: key);

  @override
  _OnBoardViewState createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> {
  OnBoardViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<OnBoardViewModel>(
      viewModel: OnBoardViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
        viewModel = model;
      },
      onPageBuilder: (BuildContext context, OnBoardViewModel value) => Scaffold(
        body: buildColumnBody(),
      ),
    );
  }

  Column buildColumnBody() {
    return Column(
      children: [
        Expanded(
          flex: 9,
          child: buildPageView(),
        ),
        Expanded(
          child: buildObserverIndicator(),
        ),
      ],
    );
  }

  PageView buildPageView() {
    return PageView.builder(
      onPageChanged: (value) {
        viewModel.onPageChanged(value);
      },
      itemCount: viewModel.onBoardModel.length,
      itemBuilder: (context, index) => Container(
        color: context.randomColor,
        child: FormColumn(
          children: [Placeholder(), Text(viewModel.onBoardModel[index].title)],
        ),
      ),
    );
  }

  Observer buildObserverIndicator() {
    return Observer(
      builder: (_) {
        return OnBoardIndicator(
          itemCount: viewModel.onBoardModel.length,
          currentIndex: viewModel.currentPageIndex,
        );
      },
    );
  }
}
