import 'package:flutter/foundation.dart';

class LoginUsernameRequest {
  final String username;
  final String password;

  LoginUsernameRequest({
    @required this.username,
    @required this.password}) :
        assert(username != null), assert(password != null);
}

class LoginPhoneRequest {
  final String phoneCode;
  final String phoneNumber;
  final String password;

  LoginPhoneRequest({
    @required this.phoneCode,
    @required this.phoneNumber,
    @required this.password}) :
        assert(phoneCode != null), assert(phoneNumber != null), assert(password != null);
}

class LoginEmailRequest {
  final String email;
  final String password;

  LoginEmailRequest({
    @required this.email,
    @required this.password}) :
        assert(email != null), assert(password != null);
}