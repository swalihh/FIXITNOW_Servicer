part of 'login_bloc.dart';

abstract class LoginEvent {}
class UserLoginEvent extends LoginEvent{
  final  Map loginDetails;

  UserLoginEvent({required this.loginDetails});
}
