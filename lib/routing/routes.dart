
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quotes_shop/features/auth/auth_bloc/auth_bloc.dart';
import 'package:quotes_shop/features/auth/sign_in/sign_in_screen.dart';
import 'package:quotes_shop/features/home/home_screen.dart';
import 'package:quotes_shop/features/home/second_home_screen.dart';
import 'package:quotes_shop/features/quotes/quotes_screen.dart';
import 'package:quotes_shop/features/setting/setting_screen.dart';
import 'package:quotes_shop/locator.dart';
import 'package:quotes_shop/routing/scaffold_with_nav_bar.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _sectionANavigatorKey =
GlobalKey<NavigatorState>();
 void routingConfig(){
   // ignore: no_leading_underscores_for_local_identifiers
   final GoRouter _router = GoRouter(
     restorationScopeId: "routes",
     navigatorKey: _rootNavigatorKey,
     initialLocation: '/auth',
     redirect: (context, state) {
       final bool isLogin= state.fullPath==  "/auth";
       final bool authenticated  =context.watch<AuthBloc>().state is AuthSuccess;
       if(isLogin) {
         if(authenticated){
           return "/";
         }
       }
       return null;
       },
     routes: [
       GoRoute(path: '/auth',builder: (context, state) => const SignInScreen(),),
       StatefulShellRoute.indexedStack(
         restorationScopeId: "routes_shell",
         builder: (BuildContext context, GoRouterState state,
             StatefulNavigationShell navigationShell) {
           return ScaffoldWithNavBar(navigationShell: navigationShell);
         },
         branches: <StatefulShellBranch>[
           StatefulShellBranch(
             restorationScopeId: "home_routes",
             navigatorKey: _sectionANavigatorKey,
             routes: <RouteBase>[
               GoRoute(
                 path: '/',
                 builder: (BuildContext context, GoRouterState state) =>
                 const HomeScreen(),
                 routes: [
                   GoRoute(path: '/second',
                   builder: (context, state) => const SecondHomeScreen(),)

                 ]
               ),
             ],
           ),

           // The route branch for the second tab of the bottom navigation bar.
           StatefulShellBranch(
             routes: <RouteBase>[
               GoRoute(
                 path: '/quotes',
                 builder: (BuildContext context, GoRouterState state) =>
                 const QuotesScreen(),
               ),
             ],
           ),

           // The route branch for the third tab of the bottom navigation bar.
           StatefulShellBranch(
             routes: <RouteBase>[
               GoRoute(
                 path: '/c',
                 builder: (BuildContext context, GoRouterState state) =>
                 const SettingScreen(),
               ),
             ],
           ),
         ],
       ),
     ],
   );
   locator.registerSingleton<GoRouter>(_router);
 }