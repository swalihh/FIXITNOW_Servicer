part of 'acceptedusers_bloc.dart';

abstract class AcceptedusersEvent {}
class FetchAcceptedUserDetailsEvent extends AcceptedusersEvent {}

class MoveToCompletedEvent extends AcceptedusersEvent{
  dynamic id;
}