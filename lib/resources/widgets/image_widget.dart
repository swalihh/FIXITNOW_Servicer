import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:servicer/resources/widgets/sizedbox.dart';
import 'package:servicer/resources/constants/fonts.dart';

class ImageContainer extends StatelessWidget {
  final String? labelText;
  final ImageProvider? imageProvider;
  final String? childText;
  final String? errorText;

  const ImageContainer({
    Key? key,
    this.labelText,
    this.imageProvider,
    this.childText,
    this.errorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null)
          Text(
            labelText!,
            style: TextType.labels,
          ),
        const TextFieldSpacing(),
        DottedBorder(
          dashPattern: const [3, 6],
          child: Container(
            height: screenSize.height / 8,
            width: screenSize.width / 3 + 12,
            decoration: BoxDecoration(
              image: imageProvider != null
                  ? DecorationImage(
                      image: imageProvider!,
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: Center(
              child: errorText != null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          childText ?? '',
                          style: TextStyle(color: Colors.red),
                        ),
                        Text(
                          errorText!,
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    )
                  : Text(childText ?? ''),
            ),
          ),
        ),
      ],
    );
  }
}
