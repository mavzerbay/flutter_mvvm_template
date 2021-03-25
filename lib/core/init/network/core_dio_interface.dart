import 'package:flutter/material.dart';

import '../../base/model/abstracts/base_model.dart';
import '../../constants/enums/http_request_enum.dart';
import 'models/response_model_interface.dart';

abstract class ICoreDio {
  Future<IResponseModel<R>> fetch<R,T extends BaseModel>(
    String path, {
    @required HttpTypes method,
    @required T parseModel,
    dynamic data,
    Map<String, Object> queryParameters,
    //CancelToken cancelToken,
    //Options options,
    //void Function(int, int) onSendProgress,
    void Function(int, int) onReceiveProgress,
  });
}
