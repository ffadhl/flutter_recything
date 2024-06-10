import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class TimContentWidget extends StatelessWidget {
  const TimContentWidget(
      {super.key,
      required this.title,
      required this.subTitle,
      this.height,
      this.width,
      this.child});
  final String title;
  final String subTitle;

  final double? height;
  final double? width;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyleConstant.boldParagraph.copyWith(
            color: ColorConstant.netralColor900,
          ),
        ),
        SpacingConstant.verticalSpacing150,
        SizedBox(
          height: height,
          width: width,
          child: child,
        ),
        SpacingConstant.verticalSpacing150,
        Text(
          subTitle,
          style: TextStyleConstant.mediumCaption
              .copyWith(color: ColorConstant.netralColor900),
        ),
        SpacingConstant.verticalSpacing250,
      ],
    );
  }
}
