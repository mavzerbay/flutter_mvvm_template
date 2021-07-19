enum NetworkRoutes { LOGIN,BUILD_HOME,SOCIAL_ALL }

extension NetworkRoutesString on NetworkRoutes {
  String get rawValue {
    switch (this) {
      case NetworkRoutes.LOGIN:
        return "/login";
        
      case NetworkRoutes.BUILD_HOME:
        return "/house";
      case NetworkRoutes.SOCIAL_ALL:
        return "/home";
      default:
        throw Exception("Routes Not Found");
    }
  }
}
