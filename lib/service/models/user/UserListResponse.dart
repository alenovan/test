// To parse this JSON data, do
//
//     final userListResponse = userListResponseFromJson(jsonString);

import 'dart:convert';

UserListResponse userListResponseFromJson(String str) => UserListResponse.fromJson(json.decode(str));

String userListResponseToJson(UserListResponse data) => json.encode(data.toJson());

class UserListResponse {
  UserListResponse({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
    this.support,
  });

  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<DataListUser>? data;
  Support? support;

  factory UserListResponse.fromJson(Map<String, dynamic> json) => UserListResponse(
    page: json["page"] == null ? null : json["page"],
    perPage: json["per_page"] == null ? null : json["per_page"],
    total: json["total"] == null ? null : json["total"],
    totalPages: json["total_pages"] == null ? null : json["total_pages"],
    data: json["data"] == null ? null : List<DataListUser>.from(json["data"].map((x) => DataListUser.fromJson(x))),
    support: json["support"] == null ? null : Support.fromJson(json["support"]),
  );

  Map<String, dynamic> toJson() => {
    "page": page == null ? null : page,
    "per_page": perPage == null ? null : perPage,
    "total": total == null ? null : total,
    "total_pages": totalPages == null ? null : totalPages,
    "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
    "support": support == null ? null : support?.toJson(),
  };
}

class DataListUser {
  DataListUser({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  factory DataListUser.fromJson(Map<String, dynamic> json) => DataListUser(
    id: json["id"] == null ? null : json["id"],
    email: json["email"] == null ? null : json["email"],
    firstName: json["first_name"] == null ? null : json["first_name"],
    lastName: json["last_name"] == null ? null : json["last_name"],
    avatar: json["avatar"] == null ? null : json["avatar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "email": email == null ? null : email,
    "first_name": firstName == null ? null : firstName,
    "last_name": lastName == null ? null : lastName,
    "avatar": avatar == null ? null : avatar,
  };
}

class Support {
  Support({
    this.url,
    this.text,
  });

  String? url;
  String? text;

  factory Support.fromJson(Map<String, dynamic> json) => Support(
    url: json["url"] == null ? null : json["url"],
    text: json["text"] == null ? null : json["text"],
  );

  Map<String, dynamic> toJson() => {
    "url": url == null ? null : url,
    "text": text == null ? null : text,
  };
}
