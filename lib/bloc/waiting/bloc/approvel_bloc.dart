

import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:servicer/models/usermodel.dart';
import 'package:servicer/repositories/authrepos.dart';

part 'approvel_event.dart';
part 'approvel_state.dart';

class ApprovelBloc extends Bloc<ApprovelEvent, ApprovelState> {
  ApprovelBloc() : super(ApprovelInitial()) {
  
  on<UserDataFetchingEvent>(userdataFetching);
  
  }

  FutureOr<void> userdataFetching(UserDataFetchingEvent event, Emitter<ApprovelState> emit) async{
     emit(UserDataLoadingState());
         print('inblock----------');

    final fetchdata=await AuthRepo().getuser();
    print('inblock----------');
    fetchdata.fold((error) =>emit(UserDataFechedErrorState(message: error.message)) ,
    
     (response) {
    if(response['servicer']['status']=='Accepted'){
      print('innnn-------------------------------------------------------');
        final UserModel userObject =UserModel.fromJson(response['servicer']);
      emit(UserDataFechedSuccessState(userObject: userObject));
    }else{
      print('--------------------------------------------------------------------scjksjkxj');
      emit(UserDataFechedErrorState(message: response['servicer']['status']));
    }
    
      
     } 
     
     );
  }
}
