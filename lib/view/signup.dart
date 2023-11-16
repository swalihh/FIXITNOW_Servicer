import 'package:flutter/material.dart';
import 'package:servicer/resources/strings/login0string.dart';
import 'package:servicer/resources/widgets/elevatedbutton.dart';
import 'package:servicer/resources/widgets/signuotextfield.dart';
import 'package:servicer/resources/widgets/sizedbox.dart';
import 'package:servicer/utils/fonts.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(22.0),
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
                ),
                const TextFieldSpacing(),
                SignUpTextField(
                  prefixIcon: const Icon(Icons.person),
                  label: 'Mail',
                  labelStyle: TextType.labels,
                  hintText: 'Mail',
                  keyboardType: TextInputType.emailAddress,
                ),
                const TextFieldSpacing(),
                SignUpTextField(
                  prefixIcon: const Icon(Icons.person),
                  label: 'Phone',
                  labelStyle: TextType.labels,
                  hintText: 'Phone',
                  keyboardType: TextInputType.phone,
                ),
                const TextFieldSpacing(),
                SignUpTextField(
                  prefixIcon: const Icon(Icons.person),
                  label: 'Password',
                  labelStyle: TextType.labels,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const TextFieldSpacing(),
                SignUpTextField(
                  prefixIcon: const Icon(Icons.person),
                  label: 'Confirm Password',
                  labelStyle: TextType.labels,
                  hintText: 'Comfirm Password',
                  obscureText: true,
                ),
                const TextFieldSpacingBig(),
                CustomElevatedButton(buttonText: 'Continue',
                onPressed: () {
                  
                },)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
