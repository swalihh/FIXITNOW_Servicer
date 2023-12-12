import 'package:flutter/material.dart';
import 'package:servicer/resources/constants/colors.dart';
import 'package:servicer/resources/widgets/circularavatar.dart';
import 'package:servicer/resources/widgets/customappbar.dart';
import 'package:servicer/utils/fonts.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
        
            title: Text(
              
              'Home',
              style: TextType.appName,
            ),
            backgroundColor: Appcolor.backgroundColor,
            leading: const CircularAvatarWidget(
                imagePath: 'assets/images/plumber.jpg')),
      ),
    );
  }
}
