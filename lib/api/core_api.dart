import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:dio_cache_flutter_test/api/network_constanst.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

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
      headers: {},
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
    } catch  (error) {
      log(error.toString());
      throw error;
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
      throw error;
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
      throw error;
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
