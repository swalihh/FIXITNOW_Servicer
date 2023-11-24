part of 'signup_bloc.dart';


abstract class SignupState {}

final class SignupInitial extends SignupState {}
 
final class SignUpSuccessState extends SignupState{
}
 final class SignUpFailerState extends SignupState{}
 final class SignUpErrorState extends SignupState{
  final String message;

  SignUpErrorState({required this.message});
 }
 final class SignUploadingState extends SignupState{}
 final class OtpMatchedState extends SignupState{}
 final class OtpNotMatchState extends SignupState{}
 final class RegistrationSuccessState extends SignupState{

 }
  final class RegistrationErrorState extends SignupState{

 }
  final class RegistrationLoadingState extends SignupState{

 }
 
