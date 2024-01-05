import 'package:flutter/material.dart';
import 'package:servicer/resources/constants/fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? leading;
  final Color backgroundColor;
  final double elevation;
  final String? rightText;

  const CustomAppBar({
    Key? key,
    this.title,
    this.leading,
    required this.backgroundColor,
    this.elevation = 0,
    this.rightText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: AppBar(
        title: title,
        leading: leading,
        backgroundColor: backgroundColor,
        elevation: elevation,
        actions: <Widget>[
          if (rightText != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Center(
                child: Text(
                  rightText!,
                  style:TextType.appName
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
