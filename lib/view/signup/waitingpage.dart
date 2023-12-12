
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:progress_loading_button/progress_loading_button.dart';
import 'package:servicer/bloc/waiting/bloc/approvel_bloc.dart';
import 'package:servicer/resources/constants/colors.dart';
import 'package:servicer/resources/strings/login0string.dart';
import 'package:servicer/resources/widgets/sizedbox.dart';
import 'package:servicer/utils/fonts.dart';
import 'package:servicer/view/home/bottombar.dart';
import 'package:servicer/view/home/home.dart';

class Waiting extends StatelessWidget {
   Waiting({super.key});
  bool isloading =false;
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: SizedBox(
              height: screenSize.height,
              width: screenSize.width,
              child: Column(children: [
                const TextFieldSpacingBig(),
                const TextFieldSpacingBig(),
                Text(
                  Loginstring.waiting,
                  style: TextType.headings,
                  textAlign: TextAlign.center,
                ),
                Center(
                  child: SizedBox(
                      // color: Colors.black,
                      width: screenSize.width,
                      child: SvgPicture.asset(
                        "assets/images/wait.svg",
                        width: screenSize.width / 2 + 70,
                        height: screenSize.height / 2 * 2 - 280,
                      )),
                ),
                BlocConsumer<ApprovelBloc, ApprovelState>(
                  listener: (context, state) {
                  if(state is UserDataFechedErrorState){
                    print(state.message);
                    isloading=false;
                  }else if(state is UserDataLoadingState){
                    isloading=true;
                  }else if(state is UserDataFechedSuccessState){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home(),));
                  }
                  },
                  builder: (context, state) {
                    return LoadingButton(
                        color: Appcolor.secondaryColor,
                        defaultWidget: Text('Check Status'),
                        animate: isloading,
                        onPressed: () async {
                         context.read<ApprovelBloc>().add(UserDataFetchingEvent());
                        });
                  },
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
