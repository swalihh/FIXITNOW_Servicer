import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:servicer/repositories/authrepos.dart';
import 'package:servicer/data/sharedpreference/sharedpref.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<SignupUserEvent>(signupUser);
    on<OtpValidationEvent>(validateOtp);
   // on<ServicerRegistrationEvent>(registration);
  }
  late int otpfromApi;
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
    }, (responce)  {
      print(responce);
      otpfromApi = int.parse(responce['otp']);
      id =responce['id'];
       Sharedprfe.instance.storage(id);
      // print(otpfromApi);
      // print(id);
      //shared preference
      emit(SignUpSuccessState());
    });
  }

  FutureOr<void> validateOtp(
      OtpValidationEvent event, Emitter<SignupState> emit) {
    if (event.otp == otpfromApi) {
      emit(OtpMatchedState());
    } else {
      emit(OtpNotMatchState());
    }
  }

//   FutureOr<void> registration(ServicerRegistrationEvent event, Emitter<SignupState> emit) {
//     Future getImageUrlFromFirebase( image) async {
   
//     String? imageFirebaseUrl;
//     {
//       String uniqueName = DateTime.now().millisecond.toString();
//       Reference fireBaseRootReference = FirebaseStorage.instance.ref();
//       Reference toUploadImgReference =
//           fireBaseRootReference.child('myPictures$uniqueName.png');
//       try {
//         await toUploadImgReference.putFile(File(image));
//         imageFirebaseUrl = await toUploadImgReference.getDownloadURL();
//         return imageFirebaseUrl;
//       } catch (e) {
//         return null;
//  }
// }
// }
//   }
}
