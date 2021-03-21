import 'package:flutter_test/flutter_test.dart';

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
  });
}
