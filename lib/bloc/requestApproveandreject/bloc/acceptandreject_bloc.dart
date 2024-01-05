import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:servicer/repositories/bookingrepo.dart';
part 'acceptandreject_event.dart';
part 'acceptandreject_state.dart';

class AcceptandrejectBloc
    extends Bloc<AcceptandrejectEvent, AcceptandrejectState> {
  AcceptandrejectBloc() : super(AcceptandrejectInitial()) {
    on<RejectEvent>(rejectUser);
    on<AcceptEvent>(acceptUser);
  }

  FutureOr<void> rejectUser(
      RejectEvent event, Emitter<AcceptandrejectState> emit) async {
        print('--------------------------------------------------------------------1234');
    emit(RejectUserLoadingState(index: event.index));
    final responce = await BookingRepo().userStatus(event.status);
    responce.fold((error) => emit(RejectUserErrorState(message: error.message)),
        (responce) {
      emit(RejectUserSucessState(message: responce['data']));
   
    });
  }

  FutureOr<void> acceptUser(
      AcceptEvent event, Emitter<AcceptandrejectState> emit) async {
    emit(AcceptUserLoadingState(index: event.index));
    final responce = await BookingRepo().userStatus(event.status);
    responce.fold((error) => emit(AcceptUserErrorState(message: error.message)),
        (responce) {
      emit(AcceptUserSucessState(message: responce['data']));
    });
  }
}
