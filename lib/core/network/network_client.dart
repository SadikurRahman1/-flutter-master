import 'dart:convert';
import 'dart:io';

class NetworkClient {
  final HttpClient _httpClient = HttpClient();

  Future<ResponseData> send(RequestData request) async {
    try {
      final uri = Uri.parse(request.url);
      final httpRequest = await _createHttpRequest(request, uri);

      request.headers.forEach((key, value) => httpRequest.headers.set(key, value));

      if (request.body != null && ["POST", "PUT", "PATCH"].contains(request.method.toUpperCase())) {
        httpRequest.write(jsonEncode(request.body));
      }

      final httpResponse = await httpRequest.close();
      final body = await httpResponse.transform(utf8.decoder).join();

      final headers = <String, String>{};
      httpResponse.headers.forEach((name, values) => headers[name] = values.join(","));

      return ResponseData(statusCode: httpResponse.statusCode, body: body, headers: headers);
    } catch (e) {
      return ResponseData(statusCode: 0, body: e.toString(), headers: {});
    }
  }

  Future<HttpClientRequest> _createHttpRequest(RequestData request, Uri uri) async {
    switch (request.method.toUpperCase()) {
      case "GET":
        return _httpClient.getUrl(uri);
      case "POST":
        return _httpClient.postUrl(uri);
      case "PUT":
        return _httpClient.putUrl(uri);
      case "PATCH":
        return _httpClient.patchUrl(uri);
      case "DELETE":
        return _httpClient.deleteUrl(uri);
      default:
        throw UnsupportedError("HTTP method not supported: ${request.method}");
    }
  }
}

class RequestData {
  String method;
  String url;
  Map<String, String> headers;
  dynamic body;

  RequestData({required this.method, required this.url, this.headers = const {}, this.body});
}

class ResponseData {
  int statusCode;
  String body;
  Map<String, String> headers;

  ResponseData({required this.statusCode, required this.body, this.headers = const {}});
}
