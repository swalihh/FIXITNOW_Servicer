
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:servicer/bloc/sign_up/signup_bloc.dart';
import 'package:servicer/resources/constants/colors.dart';
import 'package:servicer/resources/strings/login0string.dart';
import 'package:servicer/resources/widgets/elevatedbutton.dart';
import 'package:servicer/resources/widgets/sizedbox.dart';
import 'package:servicer/utils/fonts.dart';
import 'package:servicer/view/signup/register.dart';

class Otpfirst extends StatelessWidget {
  Otpfirst({super.key});
  final otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String? otp;

    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: SingleChildScrollView(
            child: SizedBox(
              height: screenSize.height,
              width: screenSize.width,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const TextFieldSpacingBig(),
                    Text(
                      Loginstring.otp,
                      style: TextType.headings,
                    ),
                    Text(
                      Loginstring.otpsub,
                      style: TextType.labels,
                    ),
                    SizedBox(
                      height: screenSize.height / 2 + 180,
                      // color: Colors.black,
                      child: OtpTextField(
                        onSubmit: (value) {
                          otpController.text = value;
                          context.read<SignupBloc>().add(OtpValidationEvent(
                              otp: int.parse(otpController.text)));
                          print(otp);
                        },
                        showFieldAsBox: true,
                      ),
                    ),
                    BlocListener<SignupBloc, SignupState>(
                      listener: (context, state) {
                        if (state is OtpMatchedState) {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) => Registeration(),
                          ));
                        } else if (state is OtpNotMatchState) {
                           Flushbar(
                            title: Loginstring.ivalidOtp,
                            message:
                                Loginstring.otpmsg,
                            backgroundColor: Colors.red,
                            duration: const Duration(seconds: 3),
                            boxShadows: [
                              BoxShadow(
                                color: Colors.red[800]!,
                                offset: const Offset(0.0, 2.0),
                                blurRadius: 3.0,
                              )
                            ],
                          ).show(context);

                        
                        }
                      },
                      child: CustomElevatedButton(
                        onPressed: () {
                          if (otpController.text.length <= 4) {
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                backgroundColor:Appcolor.errorcolor,
                                
                                content: Text('invalid')));
                          } else {
                            ///
                          }
                        },
                        buttonText: 'Continue',
                      ),
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
