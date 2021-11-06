import 'dart:convert';
import 'package:flutter/material.dart';
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
      // print("user data : $data");
      //encode Map to JSON
      var body = json.encode(data);
      var response = await http.post(url,
          headers: {"Content-Type": "application/x-www-form-urlencoded"},
          body: body
      );
      print("rsponse body : ${response.statusCode}");
      if (response.statusCode == 200) {
        final responseJson = json.decode(response.body);
        print("registration response : ${responseJson}");
        UserModel userModel = UserModel.fromJson(responseJson);
        return userModel;
      } else
      {
        final responseJson = json.decode(response.body);
        String error = responseJson['message'];
        Get.defaultDialog(title: "Oops!", middleText: _parseHtmlString(error));
      }
    } catch (e) {
      print(e);

    }
  }

  String _parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString = parse(document.body!.text).documentElement!.text;
    return parsedString;
  }
}