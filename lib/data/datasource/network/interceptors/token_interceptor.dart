import 'package:balancebyte/configs/environment/environment_helper.dart';
import 'package:balancebyte/core/logger.dart';
import 'package:balancebyte/data/datasource/local/facade/secure_storage_interface.dart';
import 'package:dio/dio.dart';

import 'package:logger/logger.dart';

class TokenInterceptor extends Interceptor {
  TokenInterceptor({
    required ISecureStorage authStore,
    required EnvironmentHelper environmentHelper,
  })  : _authStore = authStore,
        _environmentHelper = environmentHelper {
    logger.i('Create TokenInterceptor');
  }

  final ISecureStorage _authStore;
  final EnvironmentHelper _environmentHelper;

  final Logger logger = getLogger('TokenInterceptor');

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    logger.i('onRequest, ${options.baseUrl + options.path}');

    final String token = "Bearer ${await _authStore.getToken()}";
    options.headers['accept'] = 'application/json';
    options.headers['Content-Type'] = 'application/json';
    // options.headers['X-API-Key'] = _environmentHelper.apiToken;
    options.headers['Authorization'] = token;
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    logger.i('in onError, code: ${err.response?.statusCode}');
    logger.i('in onError, code: ${err.response}');
    logger.i('in onError, code: ${err}');

    // On Unauthenticated error
    if (err.response?.statusCode == 403 || err.response?.statusCode == 401) {
      logger.i('defined unauthenticated error');

      // Refresh token
      logger.i('refresh token ...');
      //final refreshResult = await GetIt.I.get<SessionCubit>().refreshToken();
      final refreshResult = true;
      logger.i('... refreshResult: $refreshResult');

      // If refresh successful, repeat request
      if (refreshResult) {
        /*// New options
        final newOptions = Options(
          method: err.requestOptions.method,
          headers: err.requestOptions.headers,
        );
        logger.i('created new options: $newOptions');

        // Repeat request
        logger.i('perform new request');
        final cloneRequest = await GetIt.I.get<Dio>().request(
              err.requestOptions.path,
              options: newOptions,
              data: err.requestOptions.data,
              queryParameters: err.requestOptions.queryParameters,
            );

        // Return updated response
        logger.i('resolve handler with new response');
        handler.resolve(cloneRequest);*/

        return;
      }
    }

    logger.i('proceed with error');
    handler.next(err);
  }
}
