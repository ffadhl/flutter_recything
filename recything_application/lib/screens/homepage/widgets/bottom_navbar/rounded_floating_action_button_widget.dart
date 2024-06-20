import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/icon_constant.dart';

class RoundedFloatingActionButton extends StatelessWidget {
  final Function() onTap;
  const RoundedFloatingActionButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 24,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorConstant.primaryColor500,
          width: 10,
        ),
        shape: BoxShape.circle,
      ),
      child: Material(
        elevation: 12,
        shadowColor: ColorConstant.whiteColor,
        shape: const CircleBorder(),
        child: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: ColorConstant.whiteColor,
          onPressed: onTap,
          child: SvgPicture.asset(
            IconConstant.iconReport,
            width: 32,
            height: 32,
          ),
        ),
      ),
    );
  }
}
