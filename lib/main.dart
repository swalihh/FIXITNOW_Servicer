
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:servicer/bloc/acceptesuser/bloc/acceptedusers_bloc.dart';
import 'package:servicer/bloc/completed/bloc/completed_bloc.dart';
import 'package:servicer/bloc/getbookings/bloc/bookings_bloc.dart';
import 'package:servicer/bloc/history/bloc/history_bloc.dart';
import 'package:servicer/bloc/login/bloc/login_bloc.dart';
import 'package:servicer/bloc/register/register_bloc.dart';
import 'package:servicer/bloc/requestApproveandreject/bloc/acceptandreject_bloc.dart';
import 'package:servicer/bloc/sign_up/signup_bloc.dart';
import 'package:servicer/bloc/waiting/bloc/approvel_bloc.dart';
import 'package:servicer/data/sharedpreference/sharedpref.dart';
import 'package:servicer/view/home/bottombar.dart';
import 'package:servicer/view/splash/splashscreen.dart';
 import 'firebase_options.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Sharedprfe.instance.init();
  
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SignupBloc()),
        BlocProvider(create: (context) => RegisterBloc(),),
        BlocProvider(create: (context) => ApprovelBloc(),),
        BlocProvider(create: (context) => LoginBloc(),),
        BlocProvider(create: (context) =>BookingsBloc() ,),
        BlocProvider(create: (context) => AcceptandrejectBloc()),
        BlocProvider(create: (context) => AcceptedusersBloc(),),
        BlocProvider(create: (context) => CompletedBloc(),),
        BlocProvider(create: (context) => HistoryBloc(),)
      ],
      child:  const MaterialApp(
        debugShowCheckedModeBanner: false,
        home:  Splash(),
      ),
    );
  }
}
