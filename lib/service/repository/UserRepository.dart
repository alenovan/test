import 'dart:convert';
import 'package:bdn_test/service/models/user/UserListResponse.dart';
import 'package:bdn_test/utils/Url.dart';
import 'package:bdn_test/utils/extentions.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

abstract class UserRepository {
  Future<UserListResponse> listUser(int page);
}

class UserRepositoryImpl implements UserRepository {
  var headers = tokenHeader();
  @override
  Future<UserListResponse> listUser(int page) async {
    var response = await http.get(Uri.parse(URL.LIST_USER + "${page}"));
    debugPrint(response.body.toString());
    if (response.statusCode == 200) {
      UserListResponse data = userListResponseFromJson(response.body);
      return data;
    } else {
      throw Exception("Error");
    }
  }
}
