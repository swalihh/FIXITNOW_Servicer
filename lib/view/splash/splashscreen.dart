import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:servicer/bloc/waiting/bloc/approvel_bloc.dart';
import 'package:servicer/data/sharedpreference/sharedpref.dart';
import 'package:servicer/view/home/home.dart';
import 'package:servicer/view/login/opening.dart';

class Splash extends StatelessWidget {
   const Splash({super.key});

  @override
  Widget build(BuildContext context) {
     _validatiion(context);
        final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
      height: screenSize.height,
      width: screenSize.width,
      color: Colors.blueAccent,

      ),
    );
  }

_validatiion (BuildContext context)async{
final id= Sharedprfe.instance.getstorage();
await Future.delayed(const Duration(seconds:3));
if(id !=null) {
// ignore: use_build_context_synchronously
context.read<ApprovelBloc>().add(UserDataFetchingEvent());
// ignore: use_build_context_synchronously
Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const Home(),));
}else{
// ignore: use_build_context_synchronously
Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const Opening(),));
 
}
}
}