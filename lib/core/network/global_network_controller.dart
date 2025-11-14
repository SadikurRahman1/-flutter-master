import 'dart:convert';
import 'package:get/get.dart';
import 'network_client.dart';
import 'network_response.dart';

class GlobalNetworkController extends GetxController {
  final NetworkClient client;

  GlobalNetworkController({required this.client});

  final RxBool isLoading = false.obs;
  final Rx<NetworkError?> error = Rx<NetworkError?>(null);
  final Rx<dynamic> data = Rx<dynamic>(null);

  Future<NetworkResponse<T>> get<T>(String url, {Map<String, String>? headers}) async =>
      _call(() => _sendRequest('GET', url, headers: headers));

  Future<NetworkResponse<T>> post<T>(
    String url, {
    Map<String, String>? headers,
    Object? body,
  }) async => _call(() => _sendRequest('POST', url, headers: headers, body: body));

  Future<NetworkResponse<T>> put<T>(
    String url, {
    Map<String, String>? headers,
    Object? body,
  }) async => _call(() => _sendRequest('PUT', url, headers: headers, body: body));

  Future<NetworkResponse<T>> patch<T>(
    String url, {
    Map<String, String>? headers,
    Object? body,
  }) async => _call(() => _sendRequest('PATCH', url, headers: headers, body: body));

  Future<NetworkResponse<T>> delete<T>(
    String url, {
    Map<String, String>? headers,
    Object? body,
  }) async => _call(() => _sendRequest('DELETE', url, headers: headers, body: body));

  Future<NetworkResponse<T>> _sendRequest<T>(
    String method,
    String url, {
    Map<String, String>? headers,
    Object? body,
    T Function(dynamic json)? parser,
  }) async {
    try {
      final request = RequestData(
        method: method,
        url: url,
        headers: {'Content-Type': 'application/json', ...?headers},
        body: body,
      );

      final response = await client.send(request);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        dynamic decoded;

        try {
          decoded = response.body.isNotEmpty ? jsonDecode(response.body) : null;
        } catch (_) {
          decoded = response.body;
        }

        final effectiveParser = parser ?? (dynamic json) => json as T;
        final result = effectiveParser(decoded);

        if (result != null) {
          return NetworkResponse.success(result);
        }

        return NetworkResponse.failure(NetworkError(message: "No data returned from API"));
      } else {
        return NetworkResponse.failure(NetworkError.fromStatus(response.statusCode, response.body));
      }
    } catch (e) {
      return NetworkResponse.failure(NetworkError(message: e.toString()));
    }
  }

  Future<NetworkResponse<T>> _call<T>(Future<NetworkResponse<T>> Function() action) async {
    isLoading.value = true;
    error.value = null;

    final response = await action();

    if (response.isSuccess) {
      data.value = response.data;
    } else {
      error.value = response.error;
    }

    isLoading.value = false;
    return response;
  }

  /// Reset global state
  void reset() {
    data.value = null;
    error.value = null;
  }
}
