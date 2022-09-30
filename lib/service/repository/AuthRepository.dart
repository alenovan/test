import 'dart:convert';
import 'dart:io';
import 'package:bdn_test/service/models/auth/RegisterPayload.dart';
import 'package:bdn_test/service/models/auth/RegisterResponse.dart';
import 'package:bdn_test/utils/Url.dart';
import 'package:bdn_test/utils/extentions.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

abstract class AuthRepository {
  Future<String> login();

  Future<RegisterResponse> register(RegisterPayload data);
}

class AuthRepoRepositoryImpl implements AuthRepository {
  var headers = {"Content-Type": "application/json"};
  @override
  Future<String> login() {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<RegisterResponse> register(RegisterPayload data) async {
    try {
      var body = jsonEncode(data);
      debugPrint(URL.REGISTER);
      var response = await http.post(Uri.parse(URL.REGISTER),
          body: body, headers: headers);
      if (response.statusCode == 200) {
        RegisterResponse responses = registerResponseFromJson(response.body);
        return responses;
      } else {
        var responses = jsonDecode(response.body);
        throw ("error dari https://reqres.in/ : ${responses["error"]}");
      }
    } on SocketException {
      throw ("Silahkan Ulangi kembali");
    } on HttpException {
      throw ("Silahkan Ulangi kembali");
    } on FormatException {
      throw ("Silahkan Ulangi kembali");
    }
  }
}
