import 'package:dio/dio.dart';

abstract class Failure {
  final String message;

  Failure({required this.message});
}

class ServerFailure extends Failure {
  ServerFailure({required super.message});

  factory ServerFailure.DioExecption(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(message: "Connection Timeout with ApiServer");
      case DioExceptionType.sendTimeout:
        return ServerFailure(message: "Send Timeout with ApiServer");
      case DioExceptionType.receiveTimeout:
        return ServerFailure(message: "Receive Timeout with ApiServer");
      case DioExceptionType.badCertificate:
        return ServerFailure(message: "Bad Certificate with ApiServer");
      case DioExceptionType.cancel:
        return ServerFailure(message: "Request Cancelled");
      case DioExceptionType.connectionError:
        return ServerFailure(message: "No Internet Connection");
      case DioExceptionType.unknown:
        return ServerFailure(message: "There was an error, try again later");
      case DioExceptionType.badResponse:
        {
          if (e.response != null) {
            switch (e.response?.statusCode) {
              case 400:
                return ServerFailure(message: "Bad request");
              case 401:
                return ServerFailure(message: "Unauthorized");
              case 403:
                return ServerFailure(message: "Forbidden");
              case 404:
                return ServerFailure(message: "Not Found");
              case 500:
                return ServerFailure(message: "Internal Server Error");
              case 502:
                return ServerFailure(message: "Bad Gateway");
              case 503:
                return ServerFailure(message: "Service Unavailable");
              case 504:
                return ServerFailure(message: "Gateway Timeout");
              default:
                {
                  return ServerFailure(
                      message:
                          "There was an error, try again later ${e.response?.statusCode}");
                }
            }
          } else {
            return ServerFailure(message: "There was an error, try again later");
          }
        }
    }
  }
}
