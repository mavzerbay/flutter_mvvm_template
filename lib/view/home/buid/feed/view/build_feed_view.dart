import 'package:flutter/material.dart';

import '../../../../../core/base/view/base_view.dart';
import '../../../../../core/extensions/context_extension.dart';
import '../../../../../core/extensions/string_extension.dart';
import '../../../../../core/init/lang/locale_keys.g.dart';
import '../viewmodel/build_feed_view_model.dart';

class BuildFeedView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<BuildFeedViewModel>(
      viewModel: BuildFeedViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
        model.getListAll();
      },
      onPageBuilder: (BuildContext context, BuildFeedViewModel value) => Scaffold(
        key: value.scaffoldKey,
        appBar: buildAppBar(context),
        body: DefaultTabController(
          length: 4,
          child: ListView(
            children: [
              TabBar(
                indicator: value.helper.circleDecoration,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  Tab(
                    text: LocaleKeys.home_build_tabbar_tab1.locale,
                  ),
                  Tab(
                    text: LocaleKeys.home_build_tabbar_tab2.locale,
                  ),
                  Tab(
                    text: LocaleKeys.home_build_tabbar_tab3.locale,
                  ),
                  Tab(
                    text: LocaleKeys.home_build_tabbar_tab4.locale,
                  ),
                ],
              ),
              SizedBox(
                height: context.size120 * 3,
                child: PageView.builder(
                  controller: PageController(viewportFraction: 0.95),
                  itemCount: 3,
                  itemBuilder: (context, index) => buildStackFloaty(context),
                ),
              ),
              Text(
                LocaleKeys.home_build_subTitle.locale,
                style: context.textTheme.headline5,
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: 3,
                shrinkWrap: true,
                itemBuilder: (context, index) => SizedBox(
                  height: context.dynamicHeight(0.21),
                  child: Card(
                    child: Row(
                      children: [
                        Expanded(flex: 3, child: Container(color: Colors.red)),
                        Expanded(flex: 9, child: buildColumnUserCard(context)),
                      ],
                    ),
                  ),
                ),
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
      leading: IconButton(
        icon: Icon(
          Icons.format_align_left,
          size: context.size28,
        ),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.search,
            size: context.size28,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget buildStackFloaty(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: context.lowValue),
      child: Stack(
        children: [
          Positioned.fill(
            bottom: context.size100,
            child: Container(
              color: context.randomColor,
            ),
          ),
          Positioned(
            top: context.size50 * 3,
            left: context.size10,
            right: context.size10,
            child: Container(
              color: context.randomColor,
              child: Padding(
                padding: context.paddingLow,
                child: buildColumnUserCard(context),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column buildColumnUserCard(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(),
          title: Text("hgfdhfdghfd"),
          subtitle: Text("Descr"),
          trailing: IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {},
          ),
        ),
        Text(
          "hgfhfgdhfghfghdfh",
          style: context.textTheme.headline5!.copyWith(fontWeight: FontWeight.w600),
        ),
        Text("Desc")
      ],
    );
  }
}
