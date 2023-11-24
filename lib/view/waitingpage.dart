import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:servicer/resources/strings/login0string.dart';
import 'package:servicer/resources/widgets/sizedbox.dart';
import 'package:servicer/utils/fonts.dart';

class Waiting extends StatelessWidget {
  const Waiting({super.key});
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
                      width: screenSize.width,
                      child: SvgPicture.asset(
                        "assets/images/wait.svg",
                        width: screenSize.width / 2 + 70,
                        height: screenSize.height / 2 * 2 - 220,
                      )),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
