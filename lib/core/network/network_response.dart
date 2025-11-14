class NetworkResponse<T> {
  final bool isSuccess;
  final T? data;
  final NetworkError? error;

  NetworkResponse._({required this.isSuccess, this.data, this.error});

  factory NetworkResponse.success(T data) => NetworkResponse._(isSuccess: true, data: data);

  factory NetworkResponse.failure(NetworkError error) =>
      NetworkResponse._(isSuccess: false, error: error);
}

class NetworkError {
  final String message;
  final int? statusCode;

  NetworkError({required this.message, this.statusCode});

  factory NetworkError.fromStatus(int statusCode, String body) {
    final msg = body.trim().isEmpty ? "Unknown error" : body;
    return NetworkError(message: msg, statusCode: statusCode);
  }

  @override
  String toString() {
    if (statusCode != null) {
      return 'Error $statusCode: $message';
    }
    return 'Error: $message';
  }
}
