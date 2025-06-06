import 'dart:async';

import 'package:http_interceptor/http_interceptor.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<BaseResponse> interceptResponse({
    required BaseResponse response,
  }) async {
    BaseResponse data = response;
    print('Response');
    print('status code: ${data.statusCode}');
    print('headers: ${data.headers}');
    return data;
  }

  @override
  Future<BaseRequest> interceptRequest({required BaseRequest request}) async {
    BaseRequest data = request;
    print('Request');
    print('url: ${data.url}');
    print('headers: ${data.headers}');
    return data;
  }

  @override
  FutureOr<bool> shouldInterceptRequest() {
    return true;
  }

  @override
  FutureOr<bool> shouldInterceptResponse() {
    return true;
  }
}
