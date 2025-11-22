import 'package:dio/dio.dart';

class TokenDioInterceptor extends Interceptor {
  TokenDioInterceptor();

  static const String apiKey = "f53a2035ef73b74ee9a9f42dba361e7d";
  static const String bearerToken = "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmNTNhMjAzNWVmNzNiNzRlZTlhOWY0MmRiYTM2MWU3ZCIsIm5iZiI6MTc2MzczNzk0NC4wNDQsInN1YiI6IjY5MjA4MTU4ZTZkMzRhMjcyOTIxYWQ5MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.T1nLmjcCfbrM-M-equpDsGZ2jNM-VmkGQcHQS2FclGg";

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {

    options.headers["Authorization"] = bearerToken;
    options.headers["Accept"] = "application/json";

    options.queryParameters.addAll({
      "api_key": apiKey,
      "language": "en-US",
    });

    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    return handler.next(err);
  }
}