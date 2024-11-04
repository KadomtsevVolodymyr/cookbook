import 'package:cookbook/domain/entities/result.dart';

sealed class NetworkResponse<T> {
  NetworkResponse();

  Result<T> when({
    required Result<T> Function(T data) onSuccess,
    required Result<T> Function(Object error) onError,
  });
}

class SuccessResponse<T> extends NetworkResponse<T> {
  SuccessResponse(this.data);

  final T data;

  @override
  Result<T> when({
    required Result<T> Function(T data) onSuccess,
    required Result<T> Function(Object error) onError,
  }) {
    return onSuccess(data);
  }
}

class ErrorResponse<T> extends NetworkResponse<T> {
  ErrorResponse(this.error);

  final Object error;

  @override
  Result<T> when({
    required Result<T> Function(T data) onSuccess,
    required Result<T> Function(Object error) onError,
  }) {
    return onError(error);
  }
}
