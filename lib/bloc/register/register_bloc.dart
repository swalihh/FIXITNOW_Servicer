import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:servicer/data/network/firebasestorage.dart';
import 'package:servicer/repositories/authrepos.dart';
part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
on<ImsgepickedEvent>(imagepiked);
on<DocumentpickedEvent>(documentpicked);
on<SubmitButtonClickedEvent>(submit);
  }

Map<String, File> images={


};
  Map<String,dynamic>verificationDocument ={ };



  FutureOr<void> imagepiked(ImsgepickedEvent event, Emitter<RegisterState> emit) async{
  
  //    final imagepath= await addTofirebase(event.imagepath);
   images ['image']= event.imagepath;
   //print(imagepath);
     emit(ImagepickedState(imagepath: event.imagepath,documentpath: images['document']));
  }

  FutureOr<void> documentpicked(DocumentpickedEvent event, Emitter<RegisterState> emit) async{
    //  final documentpath=await addTofirebase(event.documentpath);
       images ['document']=event.documentpath;
     emit(ImagepickedState(documentpath: event.documentpath,imagepath: images['image']));
  }

   
  FutureOr<void> submit(SubmitButtonClickedEvent event, Emitter<RegisterState> emit) async{
    emit(RegisterLodingState());
     verificationDocument ['fullname']=event.fullname;
     verificationDocument['description']=event.description;
     verificationDocument['servicecatagory']=event.jobType;
     verificationDocument['amount']=int.parse(event.amount);
     verificationDocument['location']=event.description;
     verificationDocument['servicerimage']=await addTofirebase(images['image']);
    verificationDocument['servicerdocument']= await addTofirebase(images['document']);
    print('-----------------------------------------77777777777777777777777777777777777777777777777777777');
print(verificationDocument['servicerimage']);
print(verificationDocument['servicerdocument']);


   

    final details= await AuthRepo().registerUser(verificationDocument);
        details.fold((error){
          emit(RegisterErrorState(message: error.message));
        },
        (responce) {
        print(responce);
          emit(RegisterSuccessState());
          
        },
        );

      

  }
}
  