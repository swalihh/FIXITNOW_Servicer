import 'package:flutter/material.dart';
import 'package:servicer/resources/constants/colors.dart';

class CircularAvatarWidget extends StatelessWidget {
  final String imagePath;
  final bool isNetworkImage;

  const CircularAvatarWidget({super.key, 
    required this.imagePath,
    this.isNetworkImage = false,
  });

  @override
  Widget build(BuildContext context) {
    double avatarSize = MediaQuery.of(context).size.width * 0.2;

    ImageProvider<Object> imageProvider;

    if (isNetworkImage) {
      imageProvider = NetworkImage(imagePath);
    } else {
      imageProvider = AssetImage(imagePath);
    }

    return Container(
      width: avatarSize,
      height: avatarSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Appcolor.primerycolor, width: 2),
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.contain ,
        ),
      ),
    );
  }
}
