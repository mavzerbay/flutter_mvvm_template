import '../../../base/model/concrete/base_error.dart';
import 'response_model_interface.dart';

class ResponseModel<T> extends IResponseModel<T> {
  final T data;
  final BaseError error;
  ResponseModel({
    this.data,
    this.error,
  });
}
