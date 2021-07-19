class SocialQuery {
  final int? limit;
  final String? q;

  SocialQuery({this.limit, this.q});
}

extension SocialQueryExtension on SocialQuery {
  String get rawValue {
    if (limit != null) {
      return 'limit';
    } else {
      return 'q';
    }
  }
}
