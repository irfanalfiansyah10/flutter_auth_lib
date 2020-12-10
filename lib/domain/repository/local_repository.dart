import 'dart:convert';

import 'package:common_lib/domain/response/response.dart';
import 'package:common_lib/helper/json_parser.dart';
import 'package:common_lib/shared/clean_code/failure.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalRepository<T extends JsonParser> {
  final String key;

  LocalRepository({@required this.key});

  Future<Response<Failure, T>> load(T Function() creator) async {
    var preference = await SharedPreferences.getInstance();

    if(preference.containsKey(key)){
      var data = creator();
      data.decode(json.decode(preference.getString(key)));
      return Response.success(data);
    }else {
      return Response.error(CacheFailure());
    }
  }

  Future<void> save({@required T data}) async {
    var preference = await SharedPreferences.getInstance();

    await preference.setString(key, jsonEncode(data.encode()));
  }

  Future<void> delete() async {
    var preference = await SharedPreferences.getInstance();

    if(preference.containsKey(key)){
      await preference.remove(key);
    }
  }
}