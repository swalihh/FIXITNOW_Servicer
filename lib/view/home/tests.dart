import 'package:flutter/material.dart';
import 'package:servicer/data/sharedpreference/sharedpref.dart';
import 'package:servicer/view/login/opening.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: AppBar(leading: IconButton(onPressed: (

      ){
        Sharedprfe.instance.removerId();
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>  Opening(),), (route) => false);
      }, icon:const Icon(Icons.abc)),),
    );
  }
}