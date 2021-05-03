enum NetworkRoutes { LOGIN,BUILD_HOME }

extension NetworkRoutesString on NetworkRoutes {
  String get rawValue {
    switch (this) {
      case NetworkRoutes.LOGIN:
        return "/login";
        break;
      case NetworkRoutes.BUILD_HOME:
        return "/house";
        break;
      default:
        throw Exception("Routes Not Found");
    }
  }
}
