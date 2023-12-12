part of 'approvel_bloc.dart';

@immutable
abstract class ApprovelState {}

final class ApprovelInitial extends ApprovelState {}
class UserDataFechedSuccessState extends ApprovelState{
  final UserModel userObject;

  UserDataFechedSuccessState({required this.userObject});
}
class UserDataFechedErrorState extends ApprovelState{
  final String? message;

  UserDataFechedErrorState({required this.message});
}
class UserDataLoadingState extends ApprovelState{}


