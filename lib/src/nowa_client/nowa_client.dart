import 'package:dio/dio.dart' as dio;
import 'package:nowa_runtime/src/nowa_client/model/response.dart';

class NowaClient {
  NowaClient({
    this.baseUrl = '',
    this.headers = const {},
    this.connectTimeout,
    this.receiveTimeout,
    this.sendTimeout,
  }) : _dioClient = dio.Dio(
          dio.BaseOptions(
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
  final dio.Dio _dioClient;

  Future<Response> get({
    required String url,
    Map<String, String> headers = const {},
    dynamic body,
  }) async {
    final dio.Response response = await _dioClient.get(
      url,
      options: dio.Options(headers: headers),
      data: body,
    );
    return Response(
      statusCode: response.statusCode!,
      data: response.data,
      headers: response.headers.map,
    );
  }

  Future<Response> post({
    required String url,
    Map<String, String> headers = const {},
    dynamic body,
  }) async {
    final dio.Response response = await _dioClient.post(
      url,
      options: dio.Options(headers: headers),
      data: body,
    );
    return Response(
      statusCode: response.statusCode!,
      data: response.data,
      headers: response.headers.map,
    );
  }

  Future<Response> put({
    required String url,
    Map<String, String> headers = const {},
    dynamic body,
  }) async {
    final dio.Response response = await _dioClient.put(
      url,
      options: dio.Options(headers: headers),
      data: body,
    );
    return Response(
      statusCode: response.statusCode!,
      data: response.data,
      headers: response.headers.map,
    );
  }

  Future<Response> delete({
    required String url,
    Map<String, String> headers = const {},
    dynamic body,
  }) async {
    final dio.Response response = await _dioClient.delete(
      url,
      options: dio.Options(headers: headers),
      data: body,
    );
    return Response(
      statusCode: response.statusCode!,
      data: response.data,
      headers: response.headers.map,
    );
  }

  Future<Response> patch({
    required String url,
    Map<String, String> headers = const {},
    dynamic body,
  }) async {
    final dio.Response response = await _dioClient.patch(
      url,
      options: dio.Options(headers: headers),
      data: body,
    );
    return Response(
      statusCode: response.statusCode!,
      data: response.data,
      headers: response.headers.map,
    );
  }

  Future<Response> head({
    required String url,
    Map<String, String> headers = const {},
    dynamic body,
  }) async {
    final dio.Response response = await _dioClient.head(
      url,
      options: dio.Options(headers: headers),
      data: body,
    );
    return Response(
      statusCode: response.statusCode!,
      data: response.data,
      headers: response.headers.map,
    );
  }

  Future<Response> options({
    required String url,
    Map<String, String> headers = const {},
    dynamic body,
  }) async {
    final dio.Response response = await _dioClient.request(
      url,
      options: dio.Options(
        headers: headers,
        method: 'OPTIONS',
      ),
      data: body,
    );
    return Response(
      statusCode: response.statusCode!,
      data: response.data,
      headers: response.headers.map,
    );
  }
}
