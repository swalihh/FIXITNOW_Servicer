
import 'package:servicer/data/network/apiservice.dart';
import 'package:servicer/data/sharedpreference/sharedpref.dart';
class AuthRepo{

final userid= Sharedprfe.instance.getstorage();

EitherResponse  userSignup(var rawData)async{
  const url ='http://10.4.6.222:5000/servicer/signup';
return await ApiServices.postApi(  rawData, url);

}

EitherResponse registerUser(var rawData) async{

  final url = 'http://10.4.6.222:5000/servicer/adddocuments/$userid';
  return await ApiServices.postApi(rawData, url);
}




}

//10.0.2.2
//ipconfig