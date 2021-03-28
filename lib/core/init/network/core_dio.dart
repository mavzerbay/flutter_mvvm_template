import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../base/model/abstracts/base_model.dart';
import '../../base/model/concrete/base_error.dart';
import '../../constants/enums/http_request_enum.dart';
import '../../extensions/network_extension.dart';
import 'core_dio_interface.dart';
import 'models/response_model.dart';
import 'models/response_model_interface.dart';

part './network_core/core_operations.dart';

class CoreDio with DioMixin implements Dio, ICoreDio {
  final BaseOptions options;

  CoreDio(this.options) {
    this.options = options;
    this.interceptors.add(InterceptorsWrapper());
    this.httpClientAdapter = DefaultHttpClientAdapter();
  }

  Future<IResponseModel<R>> fetch<R, T extends BaseModel>(
    String path, {
    @required HttpTypes method,
    @required T parseModel,
    dynamic data,
    Map<String, dynamic> queryParameters,
    void Function(int, int) onReceiveProgress,
  }) async {
    try {
      final response = await request(path, data: data, queryParameters: queryParameters, options: Options(method: method.rawValue));

      switch (response.statusCode) {
        case HttpStatus.ok:
          final model = _responseParser<R, T>(parseModel, response.data);
          return ResponseModel<R>(data: model);
        default:
          return ResponseModel<R>(error: BaseError("error message"));
      }
    } catch (e) {
      print(e.toString());
      return ResponseModel<R>(error: BaseError(e.toString()));
    }
  }
}
