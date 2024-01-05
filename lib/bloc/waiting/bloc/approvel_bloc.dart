import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:servicer/data/sharedpreference/sharedpref.dart';
import 'package:servicer/models/usermodel.dart';
import 'package:servicer/repositories/authrepos.dart';
part 'approvel_event.dart';
part 'approvel_state.dart';

class ApprovelBloc extends Bloc<ApprovelEvent, ApprovelState> {
  ApprovelBloc() : super(ApprovelInitial()) {
    on<UserDataFetchingEvent>(userdataFetching);
  }

  FutureOr<void> userdataFetching(
      UserDataFetchingEvent event, Emitter<ApprovelState> emit) async {
       // print('hiiiiii');
    emit(UserDataLoadingState());
    //r   print('inblock----------');

    final fetchdata = await AuthRepo().getuser();
//print('inblock----------');
    fetchdata
        .fold((error) => emit(UserDataFechedErrorState(message: error.message)),
            (response) {
      if (response['servicer']['status'] == 'Accepted') {
        // print('innnn-------------------------------------------------------');
        final UserModel userObject = UserModel.fromJson(response['servicer']);
       // print('${userObject.username}${userObject.email}');
        dynamic id = Sharedprfe.instance.tempgetstorage();
        if(id!=null){
        Sharedprfe.instance.storage(id);}
        // Sharedprfe.instance.removerId(key: 'registerValidation');
        // Sharedprfe.instance.removerId(key: 'otpValidation');
        Sharedprfe.instance.removerId(key: 'tempId');
        Sharedprfe.instance
            .registerCheck(key: 'registerValidation', value: false);
        Sharedprfe.instance.registerCheck(key: 'otpValidation', value: false);
        emit(UserDataFechedSuccessState(userObject: userObject));
      } else {
        // print('--------------------------------------------------------------------scjksjkxj');
        emit(UserDataFechedErrorState(message: response['servicer']['status']));
      }
    });
  }
}
