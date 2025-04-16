import 'package:dio/dio.dart';

class ServerError {
  final String error;
  ServerError(this.error);
}

class ServerFailure {
  final String message;
  final int? statusCode;
  final bool isImageError;

  ServerFailure(this.message, {this.statusCode, this.isImageError = false});

  factory ServerFailure.fromDioError(DioException e,
      {bool isImageRequest = false}) {
    if (e.response != null) {
      switch (e.response!.statusCode) {
        case 400:
          return ServerFailure(
            "Invalid request. Please check your input.",
            statusCode: 400,
            isImageError: isImageRequest,
          );
        case 401:
          return ServerFailure(
            isImageRequest
                ? "Couldn't load images (authentication required)"
                : "Authentication required",
            statusCode: 401,
            isImageError: isImageRequest,
          );
        case 402:
          return ServerFailure(
            "Payment required for this service",
            statusCode: 402,
            isImageError: isImageRequest,
          );
        case 403:
          return ServerFailure(
            "You don't have permission for this action.",
            statusCode: 403,
            isImageError: isImageRequest,
          );
        case 404:
          return ServerFailure(
            "Requested resource not found.",
            statusCode: 404,
            isImageError: isImageRequest,
          );
        case 500:
          return ServerFailure(
            "Server error. Please try again later.",
            statusCode: 500,
            isImageError: isImageRequest,
          );
        default:
          return ServerFailure(
            "An error occurred (Status ${e.response!.statusCode})",
            statusCode: e.response!.statusCode,
            isImageError: isImageRequest,
          );
      }
    } else {
      return ServerFailure(
        _getDioErrorMessage(e),
        isImageError: isImageRequest,
      );
    }
  }

  static String _getDioErrorMessage(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return "Connection timeout. Please check your internet.";
      case DioExceptionType.sendTimeout:
        return "Request took too long to send.";
      case DioExceptionType.receiveTimeout:
        return "Response took too long to receive.";
      case DioExceptionType.badCertificate:
        return "Invalid security certificate.";
      case DioExceptionType.cancel:
        return "Request was cancelled.";
      case DioExceptionType.connectionError:
        return "Connection error. Please check your internet.";
      case DioExceptionType.unknown:
        return "An unknown error occurred.";
      default:
        return "An error occurred";
    }
  }

  // Helper getters
  bool get isPaymentRequired => statusCode == 402;
  bool get isAuthenticationError => statusCode == 401;
  bool get isNotFound => statusCode == 404;

  String get errorMessage {
    if (isImageError) {
      return "Image Error: $message";
    }
    return message;
  }

  @override
  String toString() => message;
}