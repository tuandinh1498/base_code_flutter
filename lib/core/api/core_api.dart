import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

import 'network_constanst.dart';

class CustomDio {
  static CustomDio? _instance;
  late Dio _dio;

  factory CustomDio() {
    _instance ??= CustomDio._internal();
    return _instance!;
  }

  CustomDio._internal() {
    _dio = Dio();
    // Cấu hình mặc định cho Dio
    BaseOptions options = BaseOptions(
      baseUrl: NetworkConstants.baseUrl,
      connectTimeout: NetworkConstants.connectionTimeout,
      receiveTimeout: NetworkConstants.receiveTimeout,
      headers: {
        "X-Access-Token":
        "eyJhbGciOiJSUzI1NiJ9.eyJzdWIiOiIxMTAyMTYwMCIsImlhdCI6MTY5MzAyNDgzNywiZXhwIjoxNjkzMTExMjM3LCJpc3MiOiJodHRwczovL3Rpa2kudm4iLCJjdXN0b21lcl9pZCI6IjExMDIxNjAwIiwiZW1haWwiOiJ0dWFuMTQwODE5OThAZ21haWwuY29tIiwiY2xpZW50X2lkIjoidGlraS1zc28iLCJuYW1lIjoiMTEwMjE2MDAiLCJzY29wZSI6InNzbyJ9.KGjqK-b-VnQvIh_eyn7O-IuGGfxN_0pvWekM3WlUzMsL4w4WC0MkXVMu9ksdjHWt3sB3LFUsFpd9W0bEub7zYqMBYIfmLoi9N9I-qlBe0bdogsCwdsoSpNzcp4MyEWK5CaoT8sX_dtAf0tgey4JVxpLkxERSo-Z1EXE-Ja5mWIOpwjCdcYlPwjIh9Gt5jC2nAPhgd1dkapj_MKU184tC0RvMM7Sac63RcbKq10Bv1naV_XnVhFWmIVH1CSWFXRoUD7qJHJx5D-k0BNIfHFAmVC4-Iwl5twITnJZr6VhEjpbKpWVVXObOsXCEkJIXd5liyGMaYMXhpez448NXd9ynuz4N2uhywxMep5SqKibqDh4ggfpa8yyT39EXIUKpTW9mePfCwmyzmwaVLvhyqPUeUbZo0HX8aSniduU3VMtj5Ih0J6qWGVqQxtbwHUcXktrSd2fcL7w1KwKq_vobxm0RxVJOZmasv0lzNiUat7XZ4fYppLk1VjWt5E0nCM9PYIZMnyDWudACmtHV6cbBAkOgQCkc_8B_tW2MEZCr9W2S96Z6scpR-SED5aZ5qnCh7fKPllP6zeyoytEDsfXg25uwPRuIEEn59lm5-1sFMG57D789-iB6In2fNSz5bMdK_0O90PVG0wbiQzlpkbyxzr_jcfrfa8YaYN6ANLwzKGbFNIY"
      },
      contentType: 'application/json; charset=utf-8',
      responseType: ResponseType.json,
    );

    _dio.interceptors.add(DioCacheManager(CacheConfig(
      defaultMaxAge: Duration(days: 10),
      maxMemoryCacheCount: 3,
    )).interceptor);


    _dio = Dio(options);
  }

  Future<Response> get(String path,
      {Map<String, dynamic>? headers, Map<String, dynamic>? parameters}) async {
    try {
      final response = await _dio.get(path,
          options: Options(headers: headers), queryParameters: parameters);
      log("status code is: ${response.statusCode.toString()}");
      log(response.data.toString());
      return response;
    } catch (error) {
      log(error.toString());
      rethrow;
    }
  }

  Future<Response> post(String path,
      {Map<String, dynamic>? headers,
      Map<String, dynamic>? parameters,
      dynamic body}) async {
    try {
      final response = await _dio.post(path,
          options: Options(headers: headers),
          queryParameters: parameters,
          data: body);
      print(response);
      return response;
    } catch (error) {
      rethrow;
    }
  }

  Future<Response> put(String path,
      {Map<String, dynamic>? headers,
      Map<String, dynamic>? parameters,
      dynamic body}) async {
    try {
      final response = await _dio.put(path,
          options: Options(headers: headers),
          queryParameters: parameters,
          data: body);
      return response;
    } catch (error) {
      rethrow;
    }
  }

  Future<Response> delete(String path,
      {Map<String, dynamic>? headers, Map<String, dynamic>? parameters}) async {
    try {
      final response = await _dio.delete(path,
          options: Options(headers: headers), queryParameters: parameters);
      return response;
    } catch (error) {
      throw error;
    }
  }
}
