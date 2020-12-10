import 'dart:async';

import 'package:common_lib/domain/entity/customer_entity.dart';
import 'package:common_lib/domain/entity/otp_entity.dart';
import 'package:common_lib/domain/request/forgot_password_request.dart';
import 'package:common_lib/domain/request/login_request.dart';
import 'package:common_lib/domain/request/logout_request.dart';
import 'package:common_lib/domain/request/verify_otp_request.dart';
import 'package:common_lib/domain/response/response.dart';
import 'package:common_lib/helper/validator.dart';
import 'package:common_lib/shared/clean_code/failure.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';

abstract class AuthRepository {
  Future<bool> hasConnectivity() async => await (Connectivity()
      .checkConnectivity()) != ConnectivityResult.none;

  Future<Response<Failure, OtpEntity>> executeLoginWithPhone({@required LoginPhoneRequest request}) async {
    if(!await hasConnectivity()){
      return Response.error(NoInternetFailure());
    }

    if(!ValidatorHelper.isPhoneNumber(request.phoneNumber)){
      return Response.error(InvalidFormatFailure(code: InvalidFormatFailure.phone));
    }

    return await loginWithPhone(request: request);
  }

  Future<Response<Failure, CustomerEntity>> executeLoginWithUsername({@required LoginUsernameRequest request}) async {
    if(!await hasConnectivity()){
      return Response.error(NoInternetFailure());
    }
    return await loginWithUsername(request: request);
  }

  Future<Response<Failure, CustomerEntity>> executeLoginWithEmail({@required LoginEmailRequest request}) async {
    if(!await hasConnectivity()){
      return Response.error(NoInternetFailure());
    }

    if(!ValidatorHelper.isEmail(request.email)){
      return Response.error(InvalidFormatFailure(code: InvalidFormatFailure.email));
    }

    return await loginWithEmail(request: request);
  }

  Future<Response<Failure, String>> executeForgotPassword({@required ForgotPasswordRequest request}) async {
    if(!await hasConnectivity()){
      return Response.error(NoInternetFailure());
    }
    return await forgotPassword(request: request);
  }

  Future<Response<Failure, CustomerEntity>> executeVerifyOtp({@required VerifyOtpRequest request}) async {
    if(!await hasConnectivity()){
      return Response.error(NoInternetFailure());
    }
    return await verifyOtp(request: request);
  }

  Future<Response<Failure, String>> executeLogout({@required LogoutRequest request}) async {
    if(!await hasConnectivity()){
      return Response.error(NoInternetFailure());
    }
    return await logout(request: request);
  }

  @protected
  Future<Response<Failure, OtpEntity>> loginWithPhone({@required LoginPhoneRequest request});

  @protected
  Future<Response<Failure, CustomerEntity>> loginWithUsername({@required LoginUsernameRequest request});

  @protected
  Future<Response<Failure, CustomerEntity>> loginWithEmail({@required LoginEmailRequest request});

  @protected
  Future<Response<Failure, String>> forgotPassword({@required ForgotPasswordRequest request});

  @protected
  Future<Response<Failure, CustomerEntity>> verifyOtp({@required VerifyOtpRequest request});

  @protected
  Future<Response<Failure, String>> logout({@required LogoutRequest request});
}
