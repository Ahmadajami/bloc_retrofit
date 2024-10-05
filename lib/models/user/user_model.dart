// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'user_model.g.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

@JsonSerializable()
class UserModel {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "username")
  final String username;
  @JsonKey(name: "email")
  final String email;
  @JsonKey(name: "firstName")
  final String firstName;
  @JsonKey(name: "lastName")
  final String lastName;
  @JsonKey(name: "gender")
  final String gender;
  @JsonKey(name: "image")
  final String image;
  @JsonKey(name: "accessToken")
  final String accessToken;
  @JsonKey(name: "refreshToken")
  final String refreshToken;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.image,
    required this.accessToken,
    required this.refreshToken,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
