import 'dart:io';

import 'package:novasocial_admin/data/constants/app_strings.dart';
import 'package:novasocial_admin/data/models/misc/responser.dart';

class HttpException implements Exception {
  final Object? message;

  HttpException([this.message]);

  @override
  String toString() => '$message';
}

class FetchDataException extends HttpException {
  FetchDataException([message]) : super(message);
}

class BadRequestException extends HttpException {
  BadRequestException([message]) : super(message);
}

class UnauthorisedException extends HttpException {
  UnauthorisedException([message]) : super(message);
}

class InvalidDataException extends HttpException {
  InvalidDataException([String? message]) : super(message);
}

class LocalConnectionException extends HttpException {
  LocalConnectionException([String? message])
      : super(message = 'Cannot find internet connection');
}

class ErrorHandler {
  static Responser<T> error<T>(
    e, {
    StackTrace? stackTrace,
    String? socketError,
    String? noMethod,
    String? typeError,
  }) {
    switch (e.runtimeType) {
      case SocketException:
        return Responser<T>(
          message: socketError ?? AppStrings.noInternet,
          isSuccess: false,
        );
      case NoSuchMethodError:
        return Responser<T>(
          message: noMethod ?? AppStrings.serverError,
          isSuccess: false,
        );
      case TypeError:
        return Responser<T>(
          message: typeError ?? AppStrings.somethingWrong,
          isSuccess: false,
        );
      default:
        return Responser<T>(message: e.toString(), isSuccess: false);
    }
  }
}
