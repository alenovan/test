import 'dart:convert';

import 'package:flutter/cupertino.dart';

class URL {
  static const LIVE = "https://reqres.in/";
  static const BASE_URL = LIVE;
  static const LOGIN = BASE_URL + "api/login";
  static const REGISTER = BASE_URL + "api/register";
  static const LIST_USER = BASE_URL + "api/users?page=";
  static const LIST_USER_DETAIL = BASE_URL + "/api/users/";
}
