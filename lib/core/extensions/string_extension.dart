import 'package:easy_localization/easy_localization.dart';

import '../constants/app/app_constants.dart';
import '../init/lang/locale_keys.g.dart';

extension StringLocalization on String {
  String get locale => this.tr();

  String get isValidEmail => this.contains(RegExp(ApplicationConstants.EMAIL_REGEX)) ? null : LocaleKeys.login_email_required.locale;
}

extension ImagePathExtension on String {
  String get toSVG => "assets/svg/$this.svg";
}
