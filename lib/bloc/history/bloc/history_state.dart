part of 'history_bloc.dart';

abstract class HistoryState {}

final class HistoryInitial extends HistoryState {}

final class FetchCompletedUserSuccessState extends HistoryState{
      final List<BookingModel> services;

  FetchCompletedUserSuccessState({required this.services});

}
final class FetchCompletedErrorState extends HistoryState{
  final String message;

  FetchCompletedErrorState({required this.message});
}
final class FetchCompletedUserLoadingstateState extends HistoryState{}