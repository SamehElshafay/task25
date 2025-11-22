import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:task/core/utils/network_checker.dart';

class FreeDioInterceptor extends Interceptor {

  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    bool isConnected = await NetworkChecker.hasConnection();
    if (!isConnected) {
      EasyLoading.showError("No Internet Connection");
      return handler.reject(DioError(
        requestOptions: options,
        error: "No Internet Connection",
      ));
    }
    return super.onRequest(options, handler);
  }

  @override
  onResponse(Response response, ResponseInterceptorHandler handler) {
    return super.onResponse(response, handler);
  }

  @override
  onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401 || err.response?.statusCode == 403) {
      return handler.next(err);
    }
    EasyLoading.dismiss();
    return super.onError(err, handler);
  }
}
