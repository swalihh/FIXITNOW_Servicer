import 'package:flutter/material.dart'; 
import 'package:servicer/bloc/sign_up/signup_bloc.dart';
import 'package:servicer/resources/strings/login0string.dart';
import 'package:servicer/resources/widgets/loadingbutton.dart';
import 'package:servicer/resources/widgets/signuotextfield.dart';
import 'package:servicer/resources/widgets/sizedbox.dart';
import 'package:servicer/utils/fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:servicer/utils/validations.dart';
import 'package:servicer/view/otpfirst.dart';
class SignUp extends StatelessWidget {
  SignUp({super.key});
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
   final signUpKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Form(
              key: signUpKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextFieldSpacingBig(),
                  Text(
                    Loginstring.signup,
                    style: TextType.headings,
                  ),
                  const TextFieldSpacingBig(),
                  SignUpTextField(
                    prefixIcon: const Icon(Icons.person),
                    label: 'Username',
                    labelStyle: TextType.labels,
                    hintText: 'Username',
                    controller: nameController,
                    validator: (p0) => Validations.isEmpty(p0, 'username'),
                  ),
                  const TextFieldSpacing(),
                  SignUpTextField(
                    prefixIcon: const Icon(Icons.person),
                    label: 'Mail',
                    labelStyle: TextType.labels,
                    hintText: 'Mail',
                    validator: (p0) => Validations.isEmail(p0),
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const TextFieldSpacing(),
                  SignUpTextField(
                    prefixIcon: const Icon(Icons.person),
                    label: 'Phone',
                    validator: (p0) => Validations.isNumber(p0, 'Number'),
                    labelStyle: TextType.labels,
                    hintText: 'Phone',
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                  ),
                  const TextFieldSpacing(),
                  SignUpTextField(
                    prefixIcon: const Icon(Icons.person),
                    label: 'Password',
                    validator: (p0) => Validations.isPassword(p0),
                    labelStyle: TextType.labels,
                    hintText: 'Password',
                    controller: passwordController,
                    obscureText: true,
                  ),
                  const TextFieldSpacing(),
                  SignUpTextField(
                    prefixIcon: const Icon(Icons.person),
                    validator: (p0) => Validations.isPasswordMatch(p0, passwordController.text),
                    label: 'Confirm Password',
                    labelStyle: TextType.labels,
                    hintText: 'Comfirm Password',
                    controller: confirmPasswordController,
                    obscureText: true,
                  ),
                  const TextFieldSpacingBig(),
                  BlocConsumer<SignupBloc, SignupState>(
                    listener: (context, state) {
                      print(state);
                    if(state is SignUpSuccessState){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => 
                      Otpfirst(),));
                    }
                    else if(state is SignUpFailerState){
                      //snack bar

                    }else if(state is SignUpErrorState){
                      //error message
                      print(state.message);
                    }
                    },
                    builder: (context, state) {
                      bool isloading = state is SignUploadingState;
                      return Loadingbutton(
                        showloader: isloading,
                        buttonText: 'Continue',
                        onPressed: () {
                          
                          if(signUpKey.currentState!.validate()){

                          context.read<SignupBloc>().add(SignupUserEvent(username: nameController.text,email: emailController.text,password: passwordController.text, phone: phoneController.text));
                          }
                          
                        },
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
