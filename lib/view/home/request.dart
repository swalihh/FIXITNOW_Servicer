import 'package:flutter/material.dart';
import 'package:servicer/data/sharedpreference/sharedpref.dart';
import 'package:servicer/view/login/opening.dart';

class Requests extends StatelessWidget {
  const Requests({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(child: ElevatedButton(onPressed: (){
         Sharedprfe.instance.removerId();
                 Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>  Opening(),), (route) => false);


        
      }, child: Text('Log out')),),
    );
  }
}