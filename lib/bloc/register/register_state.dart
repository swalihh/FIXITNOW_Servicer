part of 'register_bloc.dart';


abstract class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterSuccessState extends RegisterState{}
final class RegisterFailerState extends RegisterState{}
final class RegisterErrorState extends RegisterState{
final String message;

  RegisterErrorState({required this.message});
}
  final class RegisterLodingState extends RegisterState{}




class ImagepickedState extends RegisterState{

final File ?imagepath;
final File ?documentpath;

  ImagepickedState({this.documentpath,  this.imagepath});
}
