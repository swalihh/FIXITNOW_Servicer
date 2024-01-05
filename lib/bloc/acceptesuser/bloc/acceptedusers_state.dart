part of 'acceptedusers_bloc.dart';

abstract class AcceptedusersState {}

final class AcceptedusersInitial extends AcceptedusersState {}

 class FetchAcceptedusersSucessState extends AcceptedusersState {
    final List<BookingModel> acceptedBooking;

  FetchAcceptedusersSucessState({required this.acceptedBooking});

 }
  class FetchAcceptedusersErrorState extends AcceptedusersState {
    final String message;

  FetchAcceptedusersErrorState({required this.message});
  }
    class FetchAcceptedusersLoadingState extends AcceptedusersState {}


    


