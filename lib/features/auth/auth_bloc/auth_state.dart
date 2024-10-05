part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState{}

final class AuthSuccess extends AuthState{
  final UserModel userModel;

  AuthSuccess({required this.userModel});
}
final class AuthLoading extends AuthState{
}

final class AuthFailure extends AuthState{
  final String errorMessage;

  AuthFailure(this.errorMessage);

}
