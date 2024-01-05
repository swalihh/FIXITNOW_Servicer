import 'package:servicer/data/network/apiservice.dart';
import 'package:servicer/data/sharedpreference/sharedpref.dart';
import 'package:servicer/resources/app_urls/apurls.dart';

class BookingRepo {
  final id = Sharedprfe.instance.getstorage();

  EitherResponse getAllBookings() async =>
      await ApiServices.getApi(AppUrl.getAllBookings + id.toString());

  EitherResponse userStatus(var rawData) async =>
      await ApiServices.postApi(rawData, AppUrl.acceptAndReject + id.toString());
}
