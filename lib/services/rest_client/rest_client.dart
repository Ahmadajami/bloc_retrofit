import 'package:dio/dio.dart';
import 'package:quotes_shop/models/forms/sign_in/sign_in_form.dart';
import 'package:quotes_shop/models/user/user_model.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';
@RestApi(baseUrl: 'https://dummyjson.com')
abstract class RestClient {
  factory RestClient (Dio dio)= _RestClient;
  @POST('/auth/login')
  Future<UserModel> login( @Body() SignInForm form );
//TODO: CALLING AUTH SERVER
}