import 'dart:convert';

UpdatedUserResponse updatedUserResponseFromJson(String str) => UpdatedUserResponse.fromJson(json.decode(str));

String updatedUserResponseToJson(UpdatedUserResponse data) => json.encode(data.toJson());

class UpdatedUserResponse {
  UpdatedUserResponse({
    this.name,
    this.firstName,
    this.lastName,
    this.email,
    this.nickname,
  });

  String? name;
  String? firstName;
  String? lastName;
  String? email;
  String? nickname;


  factory UpdatedUserResponse.fromJson(Map<String, dynamic> json) => UpdatedUserResponse(
    name: json["name"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    nickname: json["nickname"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "nickname": nickname,
  };
}

