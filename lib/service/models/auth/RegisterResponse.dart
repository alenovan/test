// To parse this JSON data, do
//
//     final registerResponse = registerResponseFromJson(jsonString);

import 'dart:convert';

RegisterResponse registerResponseFromJson(String str) => RegisterResponse.fromJson(json.decode(str));

String registerResponseToJson(RegisterResponse data) => json.encode(data.toJson());

class RegisterResponse {
  RegisterResponse({
    this.id,
    this.token,
  });

  int? id;
  String? token;

  factory RegisterResponse.fromJson(Map<String, dynamic> json) => RegisterResponse(
    id: json["id"] == null ? null : json["id"],
    token: json["token"] == null ? null : json["token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "token": token == null ? null : token,
  };
}
