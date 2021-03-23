import 'package:flutter_test/flutter_test.dart';
import 'package:fluttermvvmtemplate/core/base/model/concrete/base_error.dart';
import 'package:fluttermvvmtemplate/core/base/model/abstracts/base_model.dart';
import 'package:fluttermvvmtemplate/view/authenticate/test/model/test_model.dart';

main() {
  setUp(() {
    print("Here");
  });

  test("User Login Fail Test", () {
    final isUserLogin = true;

    expect(isUserLogin, isTrue);
  });

  group("User Login Full Test", () {
    test("User Login Fail Test 1", () {
      final isUserLogin = true;

      expect(isUserLogin, isTrue);
    });

    test("User Login Fail Test 2", () {
      final isUserLogin = true;

      expect(isUserLogin, isTrue);
    });

    test("User Login Fail Test 3", () {
      final isUserLogin = true;

      expect(isUserLogin, isTrue);
    });

    test("dynamic parse", () async {
      final error = BaseError("error");
      final errorDynamic = error as dynamic;
      
      expect(errorDynamic, isNotNull);
    });
  });
}
