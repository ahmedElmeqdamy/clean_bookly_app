import 'package:dio/dio.dart';

abstract class Failure {
  final String message;

  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("Connection timeout. Please check your internet connection.");

      case DioExceptionType.sendTimeout:
        return ServerFailure("Send timeout. Failed to send data to the server.");

      case DioExceptionType.receiveTimeout:
        return ServerFailure("Receive timeout. Server took too long to respond.");

      case DioExceptionType.badCertificate:
        return ServerFailure("Bad SSL certificate. Connection is not secure.");

      case DioExceptionType.badResponse:
        return ServerFailure.fromBadResponse(error.response!.data);

      case DioExceptionType.cancel:
        return ServerFailure("Request was cancelled.");

      case DioExceptionType.connectionError:
        return ServerFailure("Connection error. Unable to reach the server.");

      case DioExceptionType.unknown:
      return ServerFailure("Unexpected error occurred. Please try again later.");
    }
  }

  factory ServerFailure.fromBadResponse(Response? response) {
    if (response == null) {
      return ServerFailure("Unexpected server response.");
    }

    switch (response.statusCode) {
      case 400:
        return ServerFailure("Bad request. Please check your data.");
      case 401:
        return ServerFailure("Unauthorized. Please log in again.");
      case 403:
        return ServerFailure("Forbidden. You don’t have permission to access this.");
      case 404:
        return ServerFailure("Resource not found.");
      case 500:
        return ServerFailure("Internal server error. Please try again later.");
      default:
        return ServerFailure("Error: ${response.statusCode}. Please try again later.");
    }
  }
}
