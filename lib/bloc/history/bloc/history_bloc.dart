import 'dart:async';
import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:servicer/models/bookingsmodel.dart';
import 'package:servicer/repositories/bookingrepo.dart';
part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc() : super(HistoryInitial()) {
    on<FetchCompletedDetailsEvent>(fetchcompleted);
  }
  List bookingList = [];

  FutureOr<void> fetchcompleted(
      FetchCompletedDetailsEvent event, Emitter<HistoryState> emit) async {
    emit(FetchCompletedUserLoadingstateState());
    final details = await BookingRepo().getAllBookings();
    details
        .fold((error) => emit(FetchCompletedErrorState(message: error.message)),
            (responce) {
      if (responce['data'] != null) {
        bookingList = responce['data'];
        List<BookingModel> bookingsList =
            bookingList.map((e) => BookingModel.fromJson(e)).toList();

        List<BookingModel> completedBookings = bookingsList
            .where((element) => element.status == 'Completed')
            .toList();
        emit(FetchCompletedUserSuccessState(services: completedBookings));
      }
    });
  }
}
