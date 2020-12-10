import 'package:flutter/foundation.dart';

class OtpEntity{

  /// Id of the otp to send it back
  final String id;

  /// Expired time of the code
  final DateTime expiredAt;

  OtpEntity({@required this.id, @required this.expiredAt});

}