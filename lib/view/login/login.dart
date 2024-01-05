
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:servicer/bloc/acceptesuser/bloc/acceptedusers_bloc.dart';
import 'package:servicer/bloc/getbookings/bloc/bookings_bloc.dart';
import 'package:servicer/bloc/history/bloc/history_bloc.dart';
import 'package:servicer/bloc/login/bloc/login_bloc.dart';
import 'package:servicer/bloc/waiting/bloc/approvel_bloc.dart';
import 'package:servicer/resources/strings/login0string.dart';
import 'package:servicer/resources/widgets/loadingbutton.dart';
import 'package:servicer/resources/widgets/textfield.dart';
import 'package:servicer/utils/validations.dart';
import 'package:servicer/view/home/bottombar.dart';

class Login extends StatelessWidget {
   Login({super.key});
  final nameController=TextEditingController();
  final passwordController=TextEditingController();
     final signUpKey=GlobalKey<FormState>();
  @override


  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
     
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Form(
              key: signUpKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: screenSize.height * 0.04,
                  ),
                  Text(
                    Loginstring.login,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                      width: screenSize.width,
                      child: SvgPicture.asset(
                        "assets/images/login.svg",
                        width: screenSize.width / 2 + 30,
                      )),
                  SizedBox(
                    height: screenSize.height / 2 * 0.01,
                  ),
                  const Text(
                    'Mail',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                  ),
                   CustomTextField(
                    controller: nameController,
                    validator: (p0) => Validations.isEmpty(p0, 'Username'),
                    prefixIcon:const Icon(Icons.person),
                    hintText: 'Email',
                  ),
                  SizedBox(
                    height: screenSize.height / 55,
                  ),
                  const Text(
                    'Password',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                  ),
                   CustomTextField(
                    controller: passwordController,
                    validator: (p0) => Validations.isEmpty(p0,'Password'),
                    obscureText: true,
                    hintText: 'Password',
                    prefixIcon: const Icon(Icons.lock_outline_rounded),
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
                  BlocConsumer<LoginBloc, LoginState>(
                    listener: (context, state) {
                      if(state is UserLoginErorrState){
                        // Flushbar(
                        //  title: state.message??'',
                        //  backgroundColor: Appcolor.errorcolor,
                        //  flushbarPosition: FlushbarPosition.TOP,
                        //  duration: const Duration(seconds: 3),

                        //   ).show(context);
                      }else if(state is UserLoginSuccessState){
                        context.read<ApprovelBloc>().add(UserDataFetchingEvent());
      context.read<BookingsBloc>().add(GetAllBookings());
      context.read<AcceptedusersBloc>().add(FetchAcceptedUserDetailsEvent());
      context.read<HistoryBloc>().add(FetchCompletedDetailsEvent());
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>  const Start(),), (route) => false);
                      }
                    },
                    builder: (context, state) {
                      bool isloading= state is UserLoginLoadingstate;
                      return Loadingbutton(
                        showloader: isloading,
                        onPressed: () {
                          _loginCheck(context);
                        },
                        buttonText: 'Login',
                      );
                    },
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
      ),
    );
  }

  _loginCheck(BuildContext context) {
    if(signUpKey.currentState!.validate()){
    Map map={
  "email":nameController.text,
  "password":passwordController.text
};
context.read<LoginBloc>().add(UserLoginEvent(loginDetails: map));
    }
  }
}
