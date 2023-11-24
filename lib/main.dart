
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:servicer/bloc/register/register_bloc.dart';
import 'package:servicer/bloc/sign_up/signup_bloc.dart';

import 'package:servicer/data/sharedpreference/sharedpref.dart';
import 'package:servicer/view/opening.dart';
import 'package:servicer/view/register.dart';
import 'package:servicer/view/waitingpage.dart';

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
        BlocProvider(create: (context) => RegisterBloc(),)
      ],
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Opening(),
      ),
    );
  }
}
