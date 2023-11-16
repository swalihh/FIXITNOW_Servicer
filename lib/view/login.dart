import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:servicer/resources/strings/login0string.dart';
import 'package:servicer/resources/widgets/elevatedbutton.dart';
import 'package:servicer/resources/widgets/textfield.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: screenSize.height * 0.04,
                ),
                  Text(
                  Loginstring.login,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                    width: screenSize.width,
                   

                    child: SvgPicture.asset(
                      "assets/images/login.svg",
                      width: screenSize.width / 2 + 30,
                    )),
                 SizedBox(
                  height: screenSize.height/2*0.01,
                ),
                const Text(
                  'Mail',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                ),
                const CustomTextField(
                  prefixIcon: Icon(Icons.person),
                  hintText: 'Email',
                ),
                SizedBox(
                  height: screenSize.height / 55,
                ),
                const Text(
                  'Password',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                ),
                const CustomTextField(
                  hintText: 'Password',
                  prefixIcon: Icon(Icons.lock_outline_rounded),
                ),
                SizedBox(
                  height: screenSize.height / 70,
                ),
                const Text(
                  'Forget password?',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: screenSize.height / 14,
                ),
              CustomElevatedButton(
                onPressed: () {
                  
                },
                buttonText: 'Login',
              ),
                SizedBox(
                  height: screenSize.height * 0.05,
                ),
                InkWell(
                  child: Container(
                    padding: EdgeInsets.only(left: screenSize.width / 5),
                    child: RichText(
                      text: const TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Don\'t have an account? ',
                            style: TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: 'Sign in',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
