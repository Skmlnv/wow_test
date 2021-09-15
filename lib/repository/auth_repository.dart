import 'dart:convert';
import 'package:flutter_wow_auth/helpers/config.dart';
import 'package:flutter_wow_auth/models/send_code_model.dart';
import 'package:flutter_wow_auth/models/send_sms_model.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  Future<String> sendSMS(String phone) async {
    var response = await http.post(
      Uri.parse(ApiUrl + 'sms/send'),
      body: jsonEncode(<String, String>{
        'phone': phone,
      }),
    );
    var data = json.decode(response.body);
    if (response.statusCode == 200) {
      String? status = SendSMSModel.fromJson(data).status;
      return status!;
    } else {
      String? message = SendSMSModel.fromJson(data).error!.message;
      return message!;
    }
  }

  Future<SendCodeModel> sendCode(String phone, String code) async {
    var response = await http.post(
      Uri.parse(ApiUrl + 'jwt/grant'),
      body: jsonEncode(<String, String>{
        'grant_type': "secret_code",
        'username': phone,
        'secret_code': code,
      }),
    );
    var data = json.decode(response.body);
    if (response.statusCode == 200) {
      print(response.body);
      SendCodeModel? status = SendCodeModel.fromJson(data);
      return status;
    } else {
      SendCodeModel? status = SendCodeModel.fromJson(data);
      return status;
    }
  }
}
