import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;


class LoginApiClient{

  Future<String?> signInWithUserNamePassword ({String? email,String? password}) async
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
          //headers: {"Content-Type": "application/json"},
          body: body
      );
      print("rsponse body : ${response.statusCode}");
      if (response.statusCode == 200) {
        final responseJson = json.decode(response.body);
        print("registration response : $responseJson");
        return responseJson;
      } else if(response.statusCode == 403)
      {
        final responseJson = json.decode(response.body);
        String error = responseJson['message'];
        Get.defaultDialog(title: "Oops!", middleText: _parseHtmlString(error));
        return error;
      }
    } catch (e) {
      print(e);
      Get.back();
      switch (e) {
        case "ERROR_OPERATION_NOT_ALLOWED":
          Get.defaultDialog(title: "ERROR", content: Text("Contas anônimas não estão habilitadas"));
          break;
        case "ERROR_WEAK_PASSWORD":
          Get.defaultDialog(title: "ERROR", content: Text("Sua senha é muito fraca"));
          break;
        case "ERROR_INVALID_EMAIL":
          Get.defaultDialog(title: "ERROR", content: Text("Seu email é inválido"));
          break;
        case "ERROR_EMAIL_ALREADY_IN_USE":
          Get.defaultDialog(title: "ERROR", content: Text("O e-mail já está em uso em outra conta"));
          break;
        case "ERROR_INVALID_CREDENTIAL":
          Get.defaultDialog(title: "ERROR", content: Text("Seu email é inválido"));
          break;
        default:
          Get.defaultDialog(title: "ERROR", content: Text("Ocorreu um erro indefinido."));
      }
      return null;
    }
  }

  String _parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString = parse(document.body!.text).documentElement!.text;
    return parsedString;
  }
}