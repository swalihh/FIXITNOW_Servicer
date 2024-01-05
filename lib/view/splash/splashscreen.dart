// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:servicer/bloc/acceptesuser/bloc/acceptedusers_bloc.dart';
import 'package:servicer/bloc/getbookings/bloc/bookings_bloc.dart';
import 'package:servicer/bloc/history/bloc/history_bloc.dart';
import 'package:servicer/bloc/waiting/bloc/approvel_bloc.dart';
import 'package:servicer/data/sharedpreference/sharedpref.dart';
import 'package:servicer/view/home/bottombar.dart';
import 'package:servicer/view/login/opening.dart';
import 'package:servicer/view/signup/otpfirst.dart';
import 'package:servicer/view/signup/register.dart';
import 'package:servicer/view/signup/waitingpage.dart';

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

  _validatiion(BuildContext context) async {
    final id = Sharedprfe.instance.getstorage();
    final registerationCheck =
        Sharedprfe.instance.getRegisterDetails(key: 'registerValidation');
    final otpCheck =
        Sharedprfe.instance.getRegisterDetails(key: 'otpValidation');

    final tempid = Sharedprfe.instance.tempgetstorage();
    await Future.delayed(const Duration(seconds: 3));
    print(
        '--------------------------------id $id ----------reginsterCheck $registerationCheck -------------- otp $otpCheck-----------tempId $tempid');
    if (id != null) {
      context.read<ApprovelBloc>().add(UserDataFetchingEvent());
      context.read<BookingsBloc>().add(GetAllBookings());
      context.read<AcceptedusersBloc>().add(FetchAcceptedUserDetailsEvent());
      context.read<HistoryBloc>().add(FetchCompletedDetailsEvent());
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const Start(),
      ));
    } else if (tempid != null &&
        registerationCheck == false &&
        otpCheck == true) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => Registeration(),
          ),
          (route) => false);
    } else if (registerationCheck == true) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => Waiting(),
          ),
          (route) => false);
    } else if (tempid != null && otpCheck == false) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => Otpfirst(),
          ),
          (route) => false);
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const Opening(),
      ));
    }
  }
}
