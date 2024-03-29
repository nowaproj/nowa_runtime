import 'package:dio/dio.dart';

class NowaClient {
  NowaClient({
    this.baseUrl = '',
    this.headers = const {},
    this.connectTimeout,
    this.receiveTimeout,
    this.sendTimeout,
  }) : _dioClient = Dio(
          BaseOptions(
            baseUrl: baseUrl,
            headers: headers,
            connectTimeout: connectTimeout,
            receiveTimeout: receiveTimeout,
            sendTimeout: sendTimeout,
          ),
        );

  final String baseUrl;
  final Map<String, String> headers;
  final Duration? connectTimeout;
  final Duration? receiveTimeout;
  final Duration? sendTimeout;
  final Dio _dioClient;

  Future<Response> get({
    required String url,
    Map<String, String> headers = const {},
    dynamic body,
  }) async {
    try {
      final Response response = await _dioClient.get(
        url,
        options: Options(headers: headers),
        data: body,
      );
      return response;
    } on DioException catch (e) {
      final Response? response = e.response;
      if (response != null) {
        return response;
      }
      rethrow;
    }
  }

  Future<Response> post({
    required String url,
    Map<String, String> headers = const {},
    dynamic body,
  }) async {
    try {
      final Response response = await _dioClient.post(
        url,
        options: Options(headers: headers),
        data: body,
      );
      return response;
    } on DioException catch (e) {
      final Response? response = e.response;
      if (response != null) {
        return response;
      }
      rethrow;
    }
  }

  Future<Response> put({
    required String url,
    Map<String, String> headers = const {},
    dynamic body,
  }) async {
    try {
      final Response response = await _dioClient.put(
        url,
        options: Options(headers: headers),
        data: body,
      );
      return response;
    } on DioException catch (e) {
      final Response? response = e.response;
      if (response != null) {
        return response;
      }
      rethrow;
    }
  }

  Future<Response> delete({
    required String url,
    Map<String, String> headers = const {},
    dynamic body,
  }) async {
    try {
      final Response response = await _dioClient.delete(
        url,
        options: Options(headers: headers),
        data: body,
      );
      return response;
    } on DioException catch (e) {
      final Response? response = e.response;
      if (response != null) {
        return response;
      }
      rethrow;
    }
  }

  Future<Response> patch({
    required String url,
    Map<String, String> headers = const {},
    dynamic body,
  }) async {
    try {
      final Response response = await _dioClient.patch(
        url,
        options: Options(headers: headers),
        data: body,
      );
      return response;
    } on DioException catch (e) {
      final Response? response = e.response;
      if (response != null) {
        return response;
      }
      rethrow;
    }
  }

  Future<Response> head({
    required String url,
    Map<String, String> headers = const {},
    dynamic body,
  }) async {
    try {
      final Response response = await _dioClient.head(
        url,
        options: Options(headers: headers),
        data: body,

      );
      return response;
    } on DioException catch (e) {
      final Response? response = e.response;
      if (response != null) {
        return response;
      }
      rethrow;
    }
  }
}
