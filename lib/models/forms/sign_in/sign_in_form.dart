
import 'package:json_annotation/json_annotation.dart';


part 'sign_in_form.g.dart';


@JsonSerializable()
class SignInForm {
  @JsonKey(name: "username")
  final String username;
  @JsonKey(name: "password")
  final String password;
  @JsonKey(name: "expiresInMins")
   int? expiresInMins;

  SignInForm({
    required this.username,
    required this.password,
    this.expiresInMins,
  });

  factory SignInForm.fromJson(Map<String, dynamic> json) => _$SignInFormFromJson(json);

  Map<String, dynamic> toJson() => _$SignInFormToJson(this);
}
