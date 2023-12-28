import 'package:servicer/data/network/apiservice.dart';
import 'package:servicer/data/sharedpreference/sharedpref.dart';
import 'package:servicer/resources/app_urls/apurls.dart';

class AuthRepo {
  final userid = Sharedprfe.instance.getstorage();

  EitherResponse userSignup(var rawData) async {
    const url = AppUrl.userSignup;
    return await ApiServices.postApi(rawData, url);
  }

  EitherResponse registerUser(var rawData) async {
    final url = '${AppUrl.register}/$userid';
    return await ApiServices.postApi(rawData, url);
  }

  EitherResponse getuser() async => await ApiServices.getApi(
        AppUrl.userData + userid.toString(),
      );

  final url = AppUrl.login;

  EitherResponse login(var rawdata) async =>
      await ApiServices.postApi(rawdata, url);
}


//ipconfig