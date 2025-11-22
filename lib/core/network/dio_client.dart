import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:task/core/network/interceptors/token_dio_interceptor.dart';
import 'package:task/core/utils/constants.dart';

@injectable
class DioClient {
  late final Dio _dio;

  DioClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: Constants.baseUrl,
        connectTimeout: const Duration(milliseconds: 10000),
        receiveTimeout: const Duration(milliseconds: 10000),
        followRedirects: false,
        validateStatus: (status) => status != null && status < 500,
      ),
    );

    _dio.interceptors.add(TokenDioInterceptor());
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
      ),
    );
  }

  Future<Response> get(String path, {Map<String, dynamic>? query}) async {
    try {
      return await _dio.get(path, queryParameters: query);
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post({
    required String path,
    dynamic data,
    Map<String, dynamic>? query,
  }) async {
    try {
      return await _dio.post(path, data: data, queryParameters: query);
    } catch (e) {
      rethrow;
    }
  }
}