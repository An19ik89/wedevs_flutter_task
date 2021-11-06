// To parse this JSON data, do
//
//     final signUpResponse = signUpResponseFromJson(jsonString);

import 'dart:convert';

SignUpResponse signUpResponseFromJson(String str) => SignUpResponse.fromJson(json.decode(str));

String signUpResponseToJson(SignUpResponse data) => json.encode(data.toJson());

class SignUpResponse {
  SignUpResponse({
    this.code,
    this.message,
    this.data,
  });

  int? code;
  String? message;
  Data? data;

  factory SignUpResponse.fromJson(Map<String, dynamic> json) => SignUpResponse(
    code: json["code"],
    message: json["message"],
    data: json["data"] == null ? null:Data.fromJson(json["data"]) ,
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  Data({
    this.status,
  });

  int? status;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
  };
}
