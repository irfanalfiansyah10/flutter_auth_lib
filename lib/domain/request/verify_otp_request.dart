import 'package:flutter/foundation.dart';

class VerifyOtpRequest {
  final String id;
  final String code;

  VerifyOtpRequest({
    @required this.id,
    @required this.code}) :
        assert(id != null), assert(code != null);
}