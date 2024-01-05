import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:servicer/bloc/waiting/bloc/approvel_bloc.dart';
import 'package:servicer/data/sharedpreference/sharedpref.dart';
import 'package:servicer/resources/constants/colors.dart';
import 'package:servicer/resources/constants/fonts.dart';
import 'package:servicer/resources/widgets/alertbox.dart';
import 'package:servicer/view/login/opening.dart';
import 'package:shimmer/shimmer.dart';

class BottomProfileSheets extends StatelessWidget {
  const BottomProfileSheets({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          BlocBuilder<ApprovelBloc, ApprovelState>(builder: (context, state) {
            if (state is UserDataFechedSuccessState) {
              return Column(
                children: [
                  Container(
                    height: screenSize.height * 0.3,
                    width: double.maxFinite,
                    decoration: const BoxDecoration(
                        color: Appcolor.primerycolor,
                        image: DecorationImage(
                            image: AssetImage('assets/images/bg1.jpg'))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 200,
                          width: screenSize.width,
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: CachedNetworkImage(
                                  height: screenSize.height * 0.15,
                                  width: 130,
                                  fit: BoxFit.cover,
                                  imageUrl: state.userObject.servicerImage,
                                  placeholder: (context, url) =>
                                      Shimmer.fromColors(
                                    baseColor: Colors.grey.shade300,
                                    highlightColor: Colors.grey.shade100,
                                    child: Container(
                                      height: screenSize.height * 0.15,
                                      width: 130,
                                      decoration: BoxDecoration(
                                        color: Appcolor.backgroundColor,
                                        image: DecorationImage(
                                            image: NetworkImage(state
                                                .userObject.servicerImage)),
                                        border: Border.all(
                                            width: 2,
                                            color: Appcolor.backgroundColor),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                state.userObject.username,
                                style: TextType.mediumWhite,
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                state.userObject.email,
                                style: TextType.averagewhite,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            }
            return const SizedBox();
          }),
          Positioned(
            left: 15,
            right: 15,
            bottom: 50,
            child: Container(
              height: 400,
              width: screenSize.width,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 209, 209, 209),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  const ListTile(
                    leading: Icon(Icons.info),
                    title: Text('Edit Profile'),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                  const ListTile(
                    leading: Icon(Icons.help),
                    title: Text('App Info'),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                  const ListTile(
                    leading: Icon(Icons.privacy_tip),
                    title: Text('Privacy Policy'),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.logout,
                      color: Appcolor.errorcolor,
                    ),
                    title: const Text(
                      'Logout',
                      style: TextStyle(color: Appcolor.errorcolor),
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => CustomAlertDialogWidget(
                          text1: 'Log Out',
                          text2: 'Are you Sure ? ',
                          text3: 'Cancel',
                          text4: 'Confirm',
                          onPressFunction: () {
                            Sharedprfe.instance.removerId(key: 'data ');
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (context) => const Opening(),
                                ),
                                (route) => false);
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
