import 'package:flutter_test/flutter_test.dart';
import 'package:fluttermvvmtemplate/core/extensions/string_extension.dart';

main() {
  setUp(() {});

  test('Email Regexp', () {
    String email = "mavzerbay@gmail.com";
    expect(email.isValidEmail, null);
  });
}
