enum SocialQueryEnum { LIMIT, Q }

extension SocialQueryEnumString on SocialQueryEnum {
  String get rawValue {
    switch (this) {
      case SocialQueryEnum.LIMIT:
        return "limit";
      case SocialQueryEnum.Q:
        return "q";
      default:
        throw ("No Enum Found !");
    }
  }
}
