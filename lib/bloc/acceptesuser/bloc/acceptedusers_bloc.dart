import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:servicer/models/bookingsmodel.dart';
import 'package:servicer/repositories/bookingrepo.dart';
part 'acceptedusers_event.dart';
part 'acceptedusers_state.dart';

class AcceptedusersBloc extends Bloc<AcceptedusersEvent, AcceptedusersState> {
  AcceptedusersBloc() : super(AcceptedusersInitial()) {
    on<AcceptedusersEvent>(acceptedlist);
    on<MoveToCompletedEvent>(movetocomplete);
  }
  List<BookingModel>? bookings;

  FutureOr<void> acceptedlist(
      AcceptedusersEvent event, Emitter<AcceptedusersState> emit) async {
    emit(FetchAcceptedusersLoadingState());
    final bookingDetails = await BookingRepo().getAllBookings();
    bookingDetails.fold(
      (error) => emit(FetchAcceptedusersErrorState(message: error.message)),
      (responce) {
        if(responce['data']!=null){ final List bookingList = responce['data'];
        List<BookingModel> tempBookings =
            bookingList.map((e) => BookingModel.fromJson(e)).toList();
        // print(bookingList);
        // print(tempBookings[0].status);
        bookings = tempBookings
            .where((element) => element.status == 'Accepted')
            .toList();

        emit(FetchAcceptedusersSucessState(acceptedBooking: bookings!));}
       
      },
    );
  }

  FutureOr<void> movetocomplete(MoveToCompletedEvent event, Emitter<AcceptedusersState> emit) {

    bookings!.removeWhere((element) => element.id==event.id);
    emit(FetchAcceptedusersSucessState(acceptedBooking: bookings!));
  }
}
