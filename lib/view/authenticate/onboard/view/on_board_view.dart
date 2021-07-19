import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/components/text/auto_locale_text.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/extensions/string_extension.dart';
import '../../../_widgets/avatar/on_board_circle.dart';
import '../model/on_board_model.dart';
import '../view_model/on_board_view_model.dart';

class OnBoardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<OnBoardViewModel>(
      viewModel: OnBoardViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, OnBoardViewModel viewModel) => Scaffold(
        body: Padding(
          padding: context.paddingNormalHorizontal,
          child: Column(
            children: [
              Spacer(flex: 2),
              Expanded(
                flex: 5,
                child: buildPageView(viewModel),
              ),
              Expanded(
                flex: 2,
                child: buildRowFooter(viewModel, context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  PageView buildPageView(OnBoardViewModel viewModel) {
    return PageView.builder(
      itemCount: viewModel.onBoardModel.length,
      onPageChanged: (value) {
        viewModel.onPageChanged(value);
      },
      itemBuilder: (context, index) => buildColumnBody(context, viewModel.onBoardModel[index]),
    );
  }

  Row buildRowFooter(OnBoardViewModel viewModel, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: buildListViewCircle(viewModel),
        ),
        Spacer(),
        Observer(
          builder: (_) {
            return buttonSkip(context, viewModel);
          },
        ),
      ],
    );
  }

  ListView buildListViewCircle(OnBoardViewModel viewModel) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 3,
      itemBuilder: (context, index) {
        return Observer(builder: (_) {
          return OnBoardCircle(
            isSelected: viewModel.currentPageIndex == index,
          );
        });
      },
    );
  }

  FloatingActionButton buttonSkip(BuildContext context, OnBoardViewModel viewModel) {
    return FloatingActionButton(
      child: viewModel.isLoading
          ? CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(context.colors.primaryVariant),
            )
          : Icon(
              Icons.chevron_right_rounded,
              color: context.colors.primaryVariant,
              size: context.mediumValue,
            ),
      onPressed: () async {
        if (!viewModel.isLoading) {
          await viewModel.completeToOnBoard();
        }
      },
    );
  }

  Column buildColumnBody(BuildContext context, OnBoardModel model) {
    return Column(
      children: [
        Expanded(
          flex: 5,
          child: buildSvgPicture(model.imagePath),
        ),
        Spacer(flex: 1),
        buildColumnDescription(context, model),
      ],
    );
  }

  Column buildColumnDescription(BuildContext context, OnBoardModel model) {
    return Column(
      children: [
        buildAutoLocaleTextTitle(model, context),
        Padding(
          padding: context.paddingMediumHorizontal,
          child: buildAutoLocaleTextDescription(model, context),
        ),
      ],
    );
  }

  AutoLocaleText buildAutoLocaleTextTitle(OnBoardModel model, BuildContext context) {
    return AutoLocaleText(
      value: model.title.locale,
      textStyle: Theme.of(context).textTheme.headline4!.copyWith(
            fontWeight: FontWeight.bold,
            color: context.colors.primary,
          ),
    );
  }

  AutoLocaleText buildAutoLocaleTextDescription(OnBoardModel model, BuildContext context) {
    return AutoLocaleText(
      value: model.description.locale,
      textStyle: Theme.of(context).textTheme.subtitle1!.copyWith(
            fontWeight: FontWeight.w200,
          ),
      textAlign: TextAlign.center,
    );
  }

  SvgPicture buildSvgPicture(String path) => SvgPicture.asset(path);
}
