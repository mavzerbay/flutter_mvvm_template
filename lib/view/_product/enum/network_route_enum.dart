enum NetworkRoutes { LOGIN }

extension NetworkRoutesString on NetworkRoutes {
  String get rawValue {
    switch (this) {
      case NetworkRoutes.LOGIN:
        return "/login";
        break;
      default:
        throw Exception("Routes Not Found");
    }
  }
}
