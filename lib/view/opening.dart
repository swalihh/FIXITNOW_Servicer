import 'package:flutter/material.dart';
import 'package:servicer/view/login.dart';
import 'package:servicer/view/signup.dart';

class Opening extends StatelessWidget {
  const Opening({super.key});

  @override
  Widget build(BuildContext context) {
        final Size screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: double.maxFinite,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/plumber.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: double.maxFinite,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 64, 123, 255),
                    Color.fromARGB(75, 0, 0, 0),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                  stops: [0.3, 1.1],
                ),
              ),
            ),

            Positioned(
              top:screenSize.height/2+160 ,
              left: screenSize.width/9,
              child: const Text(
                
                'Unlock Your Next Career \nChapter.',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 27),),
            ),
            Positioned(
             bottom: screenSize.width*0.1,
       
              child: SizedBox( 
                width:screenSize.width*1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: const ButtonStyle(backgroundColor:MaterialStatePropertyAll(Color.fromARGB(255, 241, 198, 83))),
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                          return const SignUp();
                        },));
                      }, child: const Text('   REGISTER   ',style: TextStyle(fontWeight: FontWeight.bold),)),
                        ElevatedButton(
                      style: const ButtonStyle(backgroundColor:MaterialStatePropertyAll(Color.fromARGB(255, 255, 255, 255))),
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>const Login(),));
                      }, child: const Text('     Login      ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
