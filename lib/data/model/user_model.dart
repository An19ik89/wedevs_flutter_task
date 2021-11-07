import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.id,
    this.token,
    this.userEmail,
    this.userNicename,
    this.userDisplayName,
    this.firstName,
    this.lastName
  });

  int? id;
  String? token;
  String? userEmail;
  String? userNicename;
  String? userDisplayName;
  String? firstName;
  String? lastName;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"] == null ? null : json["id"],
    token: json["token"],
    userEmail: json["user_email"],
    userNicename: json["user_nicename"],
    userDisplayName: json["user_display_name"],
    firstName: json["first_name"] == null ? "" : json["first_name"],
    lastName: json["last_name"] == null ? "" : json["last_name"],
  );

  Map<String, dynamic> toJson() => {
    "id" : id,
    "token": token,
    "user_email": userEmail,
    "user_nicename": userNicename,
    "user_display_name": userDisplayName,
    "first_name": firstName,
    "last_name": lastName,
  };
}
