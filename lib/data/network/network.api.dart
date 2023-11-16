 import 'package:http/http.dart' as http;
class Repo{
userSignup()async{
  final url ='http://10.0.2.2:5000/servicer/signup';
final uri=Uri.parse(url);
var responce = await http.post(uri);

}

}