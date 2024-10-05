import 'package:quotes_shop/models/forms/sign_in/sign_in_form.dart';
import 'package:quotes_shop/models/user/user_model.dart';
import 'package:quotes_shop/services/rest_client/rest_client.dart';

abstract class Auth{
  Future <UserModel> login(SignInForm form);
}
class AuthService extends Auth{
  final RestClient _client;

  AuthService({required RestClient client}) : _client = client;

  @override
  Future<UserModel> login(SignInForm form) async {
    return await _client.login(form);

  }

}