part of 'signup_bloc.dart';

abstract class SignupEvent{

}


class SignupUserEvent extends SignupEvent {
final String username;
final String password;
final String email;
final String phone;

  SignupUserEvent({required this.username, required this.password, required this.email, required this.phone});


}
class OtpValidationEvent extends SignupEvent{

  final int otp;

  OtpValidationEvent({required this.otp});
}

class ServicerRegistrationEvent extends SignupEvent{

  final String fullname;
  final String description;
  final String catogory;
  final File   profile;
  final File   document;
  final String amount;
  final String location;

  ServicerRegistrationEvent({required this.fullname, required this.description, required this.catogory, required this.profile, required this.document, required this.amount, required this.location});
}

