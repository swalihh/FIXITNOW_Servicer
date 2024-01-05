part of 'completed_bloc.dart';

abstract class CompletedState {}

final class CompletedInitial extends CompletedState {}

class CompleteSrtvicerOnpressedSuccessState extends CompletedState {
 final int index;

  CompleteSrtvicerOnpressedSuccessState({required this.index});
}

class CompleteSrtvicerOnpressedLoadingState extends CompletedState {
  final int index;

  CompleteSrtvicerOnpressedLoadingState({required this.index});
}

class CompleteSrtvicerOnpressedErrorState extends CompletedState {
  final String message;

  CompleteSrtvicerOnpressedErrorState({required this.message});
}

class GetAllCompletedServiceSuccessState extends CompletedState {
  final List<BookingModel> completed;

  GetAllCompletedServiceSuccessState({required this.completed});
}

class GetAllCompletedServiceErrorState extends CompletedState {
  final String message;

  GetAllCompletedServiceErrorState({required this.message});
}
