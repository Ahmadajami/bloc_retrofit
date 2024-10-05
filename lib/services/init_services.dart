import 'package:quotes_shop/locator.dart';
import 'package:quotes_shop/services/auth_services/auth_service.dart';
import 'package:quotes_shop/services/rest_client/rest_client.dart';

void initServices(){
  locator.registerLazySingleton(()=> AuthService(client: locator.get<RestClient>()));
}