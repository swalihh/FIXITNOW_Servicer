part of 'register_bloc.dart';


abstract class RegisterEvent {}



class DocumentAddEvent extends RegisterEvent{
  final String fullname;
  final String description;
  final String jobType;
  final String amount;
  final String location;

  DocumentAddEvent({required this.fullname, required this.description, required this.jobType, required this.amount, required this.location}); 
}
class ImsgepickedEvent extends RegisterEvent{
final File imagepath;




  ImsgepickedEvent({required this.imagepath});
}
class DocumentpickedEvent extends RegisterEvent{
  final File documentpath;

  DocumentpickedEvent({required this.documentpath});
}

class SubmitButtonClickedEvent extends RegisterEvent{
  final String fullname;
  final String description;
  final String jobType;
  final String amount;
  final String location;

  SubmitButtonClickedEvent({required this.fullname, required this.description, required this.jobType, required this.amount, required this.location});
   
}
 
