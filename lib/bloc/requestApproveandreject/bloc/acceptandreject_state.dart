part of 'acceptandreject_bloc.dart';

sealed class AcceptandrejectState {}

final class AcceptandrejectInitial extends AcceptandrejectState {}

class RejectUserErrorState extends AcceptandrejectState{
 final String message;

RejectUserErrorState({required this.message});

}
class AcceptUserErrorState extends AcceptandrejectState{
 final String message;

AcceptUserErrorState({required this.message});

}
class RejectUserLoadingState extends AcceptandrejectState{
  final int index;

  RejectUserLoadingState({required this.index});
}
class AcceptUserLoadingState extends AcceptandrejectState{
  final int index;

  AcceptUserLoadingState({required this.index});
}


class RejectUserSucessState extends AcceptandrejectState{
   final String message;

  RejectUserSucessState({required this.message});
}


class AcceptUserSucessState extends AcceptandrejectState{
   final String message;

  AcceptUserSucessState({required this.message});
}

