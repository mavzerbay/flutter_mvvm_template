import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttermvvmtemplate/view/_widgets/animation/social_card_animation.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/components/button/base_text_button.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/extensions/string_extension.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../../core/init/network/vexana_manager.dart';
import '../../../_widgets/list_tile/social_card.dart';
import '../service/social_service.dart';
import '../viewmodel/social_view_model.dart';

class SocialView extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BaseView<SocialViewModel>(
      viewModel: SocialViewModel(SocialService(VexanaManager.instance.networkManager, scaffoldKey)),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, SocialViewModel viewModel) => Container(
        color: context.theme.colorScheme.background,
        padding: context.paddingLow,
        child: Scaffold(
          appBar: buildAppBar(context),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.home_social_findFriends.locale,
                style: context.textTheme.headline4!.copyWith(fontWeight: FontWeight.bold, color: Colors.black54),
              ),
              Spacer(flex: 2),
              TextField(
                controller: viewModel.searchTEC,
                onChanged: (value) {
                  viewModel.fetchAllSearchQuery();
                },
                onEditingComplete: () {
                  viewModel.fetchAllSearchQuery();
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: context.size12),
                  prefixIcon: IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.black54,
                    ),
                    onPressed: () {
                      viewModel.fetchAllSearchQuery();
                    },
                  ),
                ),
              ),
              Spacer(flex: 2),
              Expanded(
                flex: 90,
                child: Observer(builder: (_) {
                  return buildListViewUser(viewModel);
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: BaseTextButton(
        onPressed: () {},
        textColor: Colors.black,
        child: Text(LocaleKeys.home_social_cancel.locale),
      ),
      actions: [
        BaseTextButton(
          color: Colors.transparent,
          onPressed: () {},
          textColor: context.theme.buttonTheme.colorScheme!.primary,
          child: Text(
            LocaleKeys.home_social_next.locale,
            style: context.textTheme.subtitle1!.copyWith(
              fontWeight: FontWeight.w700,
              color: context.theme.buttonTheme.colorScheme!.primary,
            ),
          ),
        ),
      ],
    );
  }

  ListView buildListViewUser(SocialViewModel viewModel) {
    return ListView.builder(
      itemCount: viewModel.socialUserList.length,
      itemBuilder: (context, index) {
        viewModel.fetchAllUserLazy(index);
        return OpenContainerSocialWrapper(
          socialUser: viewModel.socialUserList[index],

          closedBuilder: (context, action) => SocialCard(
            user: viewModel.socialUserList[index],
            onPressed: action,
          ),
        );
      },
    );
  }
}
