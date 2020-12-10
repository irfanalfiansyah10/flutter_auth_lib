import 'package:flutter/foundation.dart';

/// Throw this if you want to get server exception
class ServerException implements Exception {
  /// code from server
  final int code;

  /// message from server
  final String message;

  /// data from server
  final String data;

  ServerException({@required this.code, @required this.message, this.data});
}

/// Throw this if you want to get cache exception
class CacheException implements Exception {}
