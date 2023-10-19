class Response {
  Response({
    required this.statusCode,
    required this.data,
    required this.headers,
  });

  final int statusCode;
  final dynamic data;
  final Map<String, List<String>> headers;
}
