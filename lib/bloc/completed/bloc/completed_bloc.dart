

import 'dart:async';

import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:servicer/models/bookingsmodel.dart';
import 'package:servicer/repositories/bookingrepo.dart';

part 'completed_event.dart';
part 'completed_state.dart';

class CompletedBloc extends Bloc<CompletedEvent, CompletedState> {
  CompletedBloc() : super(CompletedInitial()) {
    on<CompleteServiceSuccessEvent>(markcompleated);
    on<GetCompletedDataFetchEvent>(completedservices);
 
  }

  FutureOr<void> markcompleated(CompleteServiceSuccessEvent event, Emitter<CompletedState> emit)async {
    emit(CompleteSrtvicerOnpressedLoadingState(index: event.index));
    final deails= await BookingRepo().userStatus(event.status);
    deails.fold((error) =>emit(CompleteSrtvicerOnpressedErrorState(message: error.message)) , (responce) {
      emit(CompleteSrtvicerOnpressedSuccessState(index: event.index));

    },);
  }

  FutureOr<void> completedservices(GetCompletedDataFetchEvent event, Emitter<CompletedState> emit) {

    final serviceList=BookingRepo().getAllBookings();

    serviceList.fold((error) => emit(GetAllCompletedServiceErrorState(message:error.message )), (responce) {
          final List bookingList = responce['data'];

          List<BookingModel> completedList=bookingList.map((e) => BookingModel.fromJson(e)).toList();
            List<BookingModel> bookings = completedList
            .where((element) => element.status == 'Completed')
            .toList();

          emit(GetAllCompletedServiceSuccessState(completed: bookings));
    });
  }
}
