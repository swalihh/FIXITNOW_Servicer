import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:servicer/models/bookingsmodel.dart';
import 'package:servicer/repositories/bookingrepo.dart';
part 'bookings_event.dart';
part 'bookings_state.dart';

class BookingsBloc extends Bloc<BookingsEvent, BookingsState> {
  BookingsBloc() : super(BookingsInitial()) {
    on<BookingsEvent>(bookingData);
    on<RemoveBooking>(removeBooking);

    
  }
   List? bookingList=[];
  List<BookingModel>? bookings;
  FutureOr<void> bookingData(
      BookingsEvent event, Emitter<BookingsState> emit) async {
    final bookingDetails = await BookingRepo().getAllBookings();
    bookingDetails.fold(
      (error) => emit(GetAllBookingErrorState(message: error.message)),
      (responce) {
 
 if(responce['data']!=null){
   bookingList = responce['data'];      
       List<BookingModel>   tempBookings =
            bookingList!.map((e) => BookingModel.fromJson(e)).toList();
            print(bookingList);
            print(tempBookings[0].status);
    bookings= tempBookings.where((element) => element.status=='Pending').toList();

        emit(GetAllBookingsLoadingState());
        emit(GetAllBookingsFetchSuccessState(booking: bookings!));
 }
        
      },
    );
  }


  FutureOr<void> removeBooking(RemoveBooking event, Emitter<BookingsState> emit) {
     bookings!.removeWhere((element) => element.id==event.id);
        emit(GetAllBookingsFetchSuccessState(booking: bookings!.toList()));
  }
}
