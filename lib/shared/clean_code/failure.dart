import 'package:flutter/foundation.dart';

/// Abstract class of failure
abstract class Failure  {}

class NoInternetFailure extends Failure {}

class RequestFailure extends Failure {
  /// code from server
  final int code;

  /// message from server
  final String message;

  /// data from server
  final String data;

  RequestFailure({@required this.code, @required this.message, this.data});

}

class CacheFailure extends Failure {}

class InvalidFormatFailure extends Failure {
  static const phone = 0x00;
  static const email = 0x01;

  final int code;

  InvalidFormatFailure({@required this.code});
}