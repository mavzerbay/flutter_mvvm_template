import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../view/authenticate/login/view/login_view.dart';
import '../../../view/authenticate/onboard/view/on_board_view.dart';
import '../../../view/authenticate/test/view/test_view.dart';
import '../../components/card/not_found_navigation_widget.dart';
import '../../constants/navigation/navigation_constants.dart';

class NavigationRoute {
  static NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.TEST_VIEW:
        return normalNavigate(TestsView());
      case NavigationConstants.ONBOARD_VIEW:
        return normalNavigate(OnBoardView());
      case NavigationConstants.LOGIN_VIEW:
        return normalNavigate(LoginView());
      default:
        return MaterialPageRoute(
          builder: (context) => NotFoundNavigationWidget(),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}
