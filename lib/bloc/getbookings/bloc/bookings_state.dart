part of 'bookings_bloc.dart';

abstract class BookingsState {}

final class BookingsInitial extends BookingsState {}

final class GetAllBookingsLoadingState extends BookingsState {}

class GetAllBookingErrorState extends BookingsState {
  final String message;

  GetAllBookingErrorState({required this.message});
}

class GetAllBookingsFetchSuccessState extends BookingsState {
  final List<BookingModel> booking;

  GetAllBookingsFetchSuccessState({required this.booking});
}

class RejectSuccessfulState extends BookingsState{}
class RejectErrorState extends BookingsState{
  final String message;

  RejectErrorState({required this.message});
}






