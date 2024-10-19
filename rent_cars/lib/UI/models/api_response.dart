// models/api_response.dart
class ApiResponse<T> {
  final bool success;
  final String message;
  final T? data;

  ApiResponse({
    required this.success,
    required this.message,
    this.data,
  });

  // Convert JSON to ApiResponse
  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic) fromJsonT,
  ) {
    return ApiResponse(
      success: json['success'],
      message: json['message'],
      data: json['data'] != null ? fromJsonT(json['data']) : null,
    );
  }

  // Convert ApiResponse to JSON
  Map<String, dynamic> toJson(Map<String, dynamic> Function(T?) toJsonT) {
    return {
      'success': success,
      'message': message,
      'data': data != null ? toJsonT(data) : null,
    };
  }
}
