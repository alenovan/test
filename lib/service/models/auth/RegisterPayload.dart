// To parse this JSON data, do
//
//     final registerPayload = registerPayloadFromJson(jsonString);

import 'dart:convert';

RegisterPayload registerPayloadFromJson(String str) => RegisterPayload.fromJson(json.decode(str));

String registerPayloadToJson(RegisterPayload data) => json.encode(data.toJson());

class RegisterPayload {
  RegisterPayload({
    this.email,
    this.password,
  });

  String? email;
  String? password;

  factory RegisterPayload.fromJson(Map<String, dynamic> json) => RegisterPayload(
    email: json["email"] == null ? null : json["email"],
    password: json["password"] == null ? null : json["password"],
  );

  Map<String, dynamic> toJson() => {
    "email": email == null ? null : email,
    "password": password == null ? null : password,
  };
}
