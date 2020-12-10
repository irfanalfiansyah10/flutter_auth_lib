import 'package:common_lib/helper/json_parser.dart';

class CustomerEntity with JsonParser{
  String name;
  String email;
  String phoneNumber;

  @override
  void decode(Map<String, dynamic> json) {
    name = json["name"];
    email = json["email"];
    phoneNumber = json["phone_number"];
  }

  @override
  Map<String, dynamic> encode() => {
    "name" : name,
    "email" : email,
    "phone_number" : phoneNumber,
  };
}