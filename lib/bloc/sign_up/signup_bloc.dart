import 'dart:async';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:servicer/repositories/authrepos.dart';
import 'package:servicer/data/sharedpreference/sharedpref.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<SignupUserEvent>(signupUser);
    on<OtpValidationEvent>(validateOtp);
  }
   int? otpfromApi;
  late int id;

  FutureOr<void> signupUser(
      SignupUserEvent event, Emitter<SignupState> emit) async {
    emit(SignUploadingState());
    final userData = {
      "username": event.username,
      "email": event.email,
      "phone": event.phone,
      "password": event.password
    };
    final data = await AuthRepo().userSignup(userData);
    data.fold((error) {
      //print('error ${error.message}');
      emit(SignUpErrorState(message: error.message));
    }, (responce) {
      print(responce);
      otpfromApi = int.parse(responce['otp']);
      id = responce['id'];
      Sharedprfe.instance.tempStorage(id);
      Sharedprfe.instance.registerCheck(key: 'otpValidation', value: false);
      if(otpfromApi!=null){
        Sharedprfe.instance.addOtp(otpfromApi!);
      }
      otpfromApi=Sharedprfe.instance.getOtp(key: 'otp');


      print("---------------------------------------- otp new one issssssssssssssss   $otpfromApi");
      // print(id);
      //shared preference
      emit(SignUpSuccessState());
    });
  }

  FutureOr<void> validateOtp(
      OtpValidationEvent event, Emitter<SignupState> emit) {
      otpfromApi=Sharedprfe.instance.getOtp(key: 'otp');

    if (event.otp == otpfromApi) {
      Sharedprfe.instance.registerCheck(key: 'otpValidation', value: true);
        Sharedprfe.instance.registerCheck(key: 'registerValidation',value: false);

      emit(OtpMatchedState());
    } else {
      Sharedprfe.instance.registerCheck(key: 'otpValidation', value: false);

      emit(OtpNotMatchState());
    }
  }
}
