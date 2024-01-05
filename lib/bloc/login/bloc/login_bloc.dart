import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:servicer/data/sharedpreference/sharedpref.dart';
import 'package:servicer/repositories/authrepos.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<UserLoginEvent>(userlogin);
  }

  FutureOr<void> userlogin(
      UserLoginEvent event, Emitter<LoginState> emit) async {
    emit(UserLoginLoadingstate());

    final either = await AuthRepo().login(event.loginDetails);

    either.fold((error) => emit(UserLoginErorrState(message: error.message)),
        (response) {
      Sharedprfe.instance.storage(response['id']);
      emit(UserLoginSuccessState());
    });
  }
}
