// To parse this JSON data, do
//
//     final usersModel = usersModelFromJson(jsonString);

import 'dart:convert';

List<UsersModel> usersModelFromJson(String str) => List<UsersModel>.from(json.decode(str).map((x) => UsersModel.fromJson(x)));

String usersModelToJson(List<UsersModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UsersModel {
  String id;
  String employeeId;
  String username;
  String password;
  String typeId;

  UsersModel({
    required this.id,
    required this.employeeId,
    required this.username,
    required this.password,
    required this.typeId,
  });

  factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
    id: json["ID"],
    employeeId: json["EMPLOYEE_ID"],
    username: json["USERNAME"],
    password: json["PASSWORD"],
    typeId: json["TYPE_ID"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "EMPLOYEE_ID": employeeId,
    "USERNAME": username,
    "PASSWORD": password,
    "TYPE_ID": typeId,
  };
}
