import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;
import 'package:wedevs_flutter_task/data/model/user_model.dart';


class LoginApiClient{

  Future<UserModel?> signInWithUserNamePassword ({String? email,String? password}) async
  {

    var url = Uri.parse('https://apptest.dokandemo.com/wp-json/jwt-auth/v1/token');

    try {
      Map data = {
        "username": email,
        "password": password
      };
      var body = json.encode(data);
      var response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: body
      );
      if (response.statusCode == 200) {
        final responseJson = json.decode(response.body);
        //print("after logged in: $responseJson");
        UserModel userModel = UserModel.fromJson(responseJson);
        return userModel;
      } else
      {
        final responseJson = json.decode(response.body);
        String error = responseJson['message'];
        Get.defaultDialog(title: "Oops!", middleText: _parseHtmlString(error));
      }
    } catch (e) {
      e.printError();
    }
  }

  Future<UserModel?> getUserDetails ({String? token}) async
  {

    var url = Uri.parse('https://apptest.dokandemo.com/wp-json/wp/v2/users/me');
    String token1 = token!.replaceFirst(RegExp('"'), '');
    String token2 = token1.replaceFirst(RegExp('"'), '');
    String headerText = "Bearer " + token2;
    try {
      var response = await http.get(url,
          headers: {"Content-Type": "application/json",HttpHeaders.authorizationHeader: headerText},
      );
      if (response.statusCode == 200)
      {
        final responseJson = json.decode(response.body);
        //print("user details : $responseJson");
        UserModel userModel = UserModel.fromJson(responseJson);
        return userModel;
      }
    } catch (e) {
      e.printError();
    }
  }

  String _parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString = parse(document.body!.text).documentElement!.text;
    return parsedString;
  }
}