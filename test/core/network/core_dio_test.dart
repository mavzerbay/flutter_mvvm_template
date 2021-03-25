
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttermvvmtemplate/core/constants/enums/http_request_enum.dart';

import 'core_dio_mock.dart';
import 'dio_mock_model.dart';

main() {
  ICoreDioFull service;
  setUp(() {
    service = CoreDioMock(BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com"));
  });

  test('CoreDio List', () async {
    final data = await service.fetch<List<PostModel>, PostModel>("/posts", method: HttpTypes.GET, parseModel: PostModel());

    expect(data.data, isList);
  });

  test('CoreDio List No Network', () async {
    final data = await service.fetchNoNetwork<List<PostModel>, PostModel>("/posts/1", method: HttpTypes.GET, parseModel: PostModel());

    expect(data.data, isList);
  });

  test('CoreDio Error', () async {
    final data = await service.fetch<List<PostModel>, PostModel>("/posts", method: HttpTypes.GET, parseModel: PostModel());

    expect(data.data, isList);
  });
}
