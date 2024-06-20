import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/icon_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/controllers/home_controller.dart';
import 'package:recything_application/screens/achievement_screen/achievement_screen.dart';
import 'package:recything_application/screens/challenge/challenge_list/challenge_list_screen.dart';
import 'package:recything_application/screens/halaman_riwayat/point_history_screen.dart';
import 'package:recything_application/widgets/global_button_widget.dart';
import 'package:recything_application/widgets/global_loading_widget.dart';

class PointsContainer extends StatelessWidget {
  PointsContainer({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorConstant.primaryColor400,
        borderRadius: BorderRadius.circular(12),
      ),
      width: double.infinity,
      height: 180,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Poin',
                  style: TextStyleConstant.semiboldCaption.copyWith(
                    color: ColorConstant.whiteColor,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(
                      () => const AchievementScreen(),
                    );
                  },
                  child: CachedNetworkImage(
                    imageUrl: controller.user['badge'] ?? '',
                    width: 30,
                    height: 30,
                    placeholder: (context, url) => const MyLoading(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              child: Text(
                controller.user['point'].toString(),
                style: TextStyleConstant.semiboldHeading3.copyWith(
                  color: ColorConstant.whiteColor,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => Get.to(() => const ChallengeListScreen()),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        vertical: 11,
                        horizontal: 30,
                      ),
                      decoration: const BoxDecoration(
                        color: ColorConstant.primaryColor500,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Tambah Poin',
                          style: TextStyleConstant.semiboldParagraph.copyWith(
                            color: ColorConstant.whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SpacingConstant.horizontalSpacing100,
                Expanded(
                  child: GestureDetector(
                    onTap: () => Get.to(() => PointHisstoryScreen()),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        vertical: 11,
                        horizontal: 30,
                      ),
                      decoration: BoxDecoration(
                        color: ColorConstant.whiteColor,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(12),
                        ),
                        border: Border.all(
                          color: ColorConstant.primaryColor500,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Riwayat',
                          style: TextStyleConstant.semiboldParagraph.copyWith(
                            color: ColorConstant.primaryColor500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
