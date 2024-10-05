import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quotes_shop/features/auth/auth_bloc/auth_bloc.dart';
import 'package:quotes_shop/locator.dart';
import 'package:quotes_shop/routing/routes.dart';
import 'package:quotes_shop/services/auth_services/auth_service.dart';
import 'package:quotes_shop/services/storage_service/storage_service.dart';
import 'package:quotes_shop/utils/network/dio_client.dart';

void main() {
  initStorage();
  routingConfig();
  initNetwork();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
        create: (context) => AuthBloc(
            authService: locator.get<AuthService>(),
            storageService: locator.get<StorageService>())..add(AuthStorageRequested())),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>();
    return MaterialApp.router(
      restorationScopeId: "root",
      debugShowCheckedModeBanner: false,
      title: 'Quotes Shop',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blueGrey, brightness: Brightness.dark),
        useMaterial3: true,
      ),
      routerConfig: locator.get<GoRouter>(),
    );
  }
}
