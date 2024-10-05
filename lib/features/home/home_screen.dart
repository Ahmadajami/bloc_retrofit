import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quotes_shop/features/auth/auth_bloc/auth_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if(state is AuthSuccess) {
            return  Text(state.userModel.username);
          }
          return TextButton(child: const Text("Home Screen"),
            onPressed: () {
              context.go('/second');
            },);
        },
      ),
    );
  }
}
