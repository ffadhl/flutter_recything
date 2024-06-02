import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/icon_constant.dart';
import 'package:recything_application/constants/image_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

// ignore: must_be_immutable
class ChallengeCompletedScreen extends StatelessWidget {
  ChallengeCompletedScreen({super.key});

  String pointChallenge = '3000';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: ColorConstant.primaryColor500,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Challenge Selesai!',
                style: TextStyleConstant.semiboldHeading3.copyWith(
                  color: ColorConstant.whiteColor,
                ),
              ),
              const SizedBox(height: 40),
              SvgPicture.asset(ImageConstant.challengeCompleted),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 64),
                child: Text(
                  'Selamat ! 6 Aksimu berhasil mendapatkan poin sebesar',
                  style: TextStyleConstant.regularSubtitle.copyWith(
                    color: ColorConstant.whiteColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    IconConstant.iconPoint,
                    height: 32,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    pointChallenge,
                    style: TextStyleConstant.semiboldHeading2.copyWith(
                      color: ColorConstant.whiteColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorConstant.whiteColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Home',
                      style: TextStyleConstant.semiboldButton.copyWith(
                        color: ColorConstant.primaryColor500,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorConstant.whiteColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Cek Riwayat Poin',
                      style: TextStyleConstant.semiboldButton.copyWith(
                        color: ColorConstant.primaryColor500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
