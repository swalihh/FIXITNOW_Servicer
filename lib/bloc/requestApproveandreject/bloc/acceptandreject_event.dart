part of 'acceptandreject_bloc.dart';

abstract class AcceptandrejectEvent {}

class AcceptEvent extends AcceptandrejectEvent{

final Map status;
final int index;
  AcceptEvent({required this.status,required this.index});

}

class RejectEvent extends AcceptandrejectEvent{

final Map status;
final int index;

  RejectEvent({required this.status,required this.index});

}
