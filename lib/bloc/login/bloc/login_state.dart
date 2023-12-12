part of 'login_bloc.dart';

abstract class LoginState {}

final class LoginInitial extends LoginState {}
final class UserLoginSuccessState extends LoginState{}
final class UserLoginErorrState extends LoginState{
  final String ?message;

  UserLoginErorrState({required this.message});
}
final class UserLoginLoadingstate extends LoginState{}
