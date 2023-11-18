
import 'package:servicer/data/network/apiservice.dart';
class AuthRepo{
EitherResponse userSignup(var rawData)async{
  final url ='http://10.4.6.54:5000/servicer/signup';
return await ApiServices.postApi(rawData, url);

}

}