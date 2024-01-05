part of 'completed_bloc.dart';

abstract class CompletedEvent {}
class CompleteServiceSuccessEvent extends CompletedEvent{
    final Map status;
    final int index;
  CompleteServiceSuccessEvent(this.index, {required this.status});

}
class GetCompletedDataFetchEvent extends CompletedEvent{}
