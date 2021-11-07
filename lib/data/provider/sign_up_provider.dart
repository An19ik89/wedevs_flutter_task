import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:wedevs_flutter_task/data/model/sign_up_response.dart';


class SignUpApiClient{

  Future<SignUpResponse?> signUpWithUserNameEmailPassword ({String? email,String? password, String? userName}) async
  {

    var url = Uri.parse('https://apptest.dokandemo.com/wp-json/wp/v2/users/register');

    try {
      Map data = {
        "username": userName,
        "email": email,
        "password": password
      };
      var body = json.encode(data);
      var response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: body
      );

      if (response.statusCode == 200) {
        final responseJson = json.decode(response.body);
        SignUpResponse response_sign = SignUpResponse.fromJson(responseJson);
         return response_sign;
      } else
      {
        final responseJson = json.decode(response.body);
        SignUpResponse response_sign = SignUpResponse.fromJson(responseJson);
        return response_sign;
      }
    } catch (e) {
      e.printError();
    }
  }
}