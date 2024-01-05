part of 'bookings_bloc.dart';

abstract class BookingsEvent {}

class GetAllBookings extends BookingsEvent {}

class RemoveBooking extends BookingsEvent {

final  dynamic id;

  RemoveBooking({required this.id});
}

class AcceptedBooking extends BookingsEvent {}


