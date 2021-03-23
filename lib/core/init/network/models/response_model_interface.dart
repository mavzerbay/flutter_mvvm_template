import '../../../base/model/concrete/base_error.dart';

abstract class IResponseModel<T> {
  T data;
  BaseError error;
}
