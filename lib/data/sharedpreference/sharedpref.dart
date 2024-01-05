import 'package:shared_preferences/shared_preferences.dart';

class Sharedprfe {
  Sharedprfe._();
  static final _instance = Sharedprfe._();
  static Sharedprfe get instance => _instance;

  static late final SharedPreferences prefs;

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  storage(int? id) async {
    print('$id llllllllllllllllllllllllllllllllll');
    await prefs.setInt("data", id!);
  }
  addOtp(int id) async {
    await prefs.setInt("otp", id);
  }
  tempStorage(int tempId) async {
    await prefs.setInt('tempId', tempId);
  }

  getstorage() {
    var id = prefs.getInt("data");
    // print('in storage $id');
    return id;
  }

  registerCheck({required String key, bool value = false}) async {
    await prefs.setBool(key, value);
  }

  getRegisterDetails({required String key}) {
    var value = prefs.getBool(key);
    return value;
  }
  
  getOtp({required String key}) {
    var value = prefs.getInt(key);
    return value;
  }

  tempgetstorage() {
    var id = prefs.getInt("tempId");
    // print('in storage $id');
    return id;
  }

  removerId({required String key}) {
    prefs.remove(key);
  }
}
