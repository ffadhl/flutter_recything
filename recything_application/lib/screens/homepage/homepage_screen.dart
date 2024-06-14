import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/image_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/screens/homepage/widgets/sections/article_section_widget.dart';
import 'package:recything_application/screens/homepage/widgets/sections/challenge_section_widget.dart';
import 'package:recything_application/screens/homepage/widgets/sections/leaderboard_section_widget.dart';
import 'package:recything_application/screens/homepage/widgets/sections/new_video_section_widget.dart';
import 'package:recything_application/screens/homepage/widgets/point/point_container_widget.dart';
import 'package:recything_application/screens/homepage/widgets/sections/report_section_widget.dart';
import 'package:recything_application/screens/homepage/widgets/search_bar_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final List<Map<String, String>> carouselDataReport = [
    {
      'title': 'Penumpukan Sampah',
      'subtitle': 'Laporkan penumpukan sampah',
      'imagePath': 'assets/images/home_images/content_penumpukan_sampah.png',
      'footerText': 'Reporting Rubbish',
    },
    {
      'title': 'Kebersihan Lingkungan',
      'subtitle': 'Jaga kebersihan lingkungan',
      'imagePath': 'assets/images/home_images/gambar_6.png',
      'footerText': 'Environmental Cleanliness',
    },
  ];

  final List<Map<String, String>> carouselDataNewVideo = [
    {
      'title': 'Cara Mudah Memilah Sampah di Rumah',
      'imagePath': 'assets/images/home_images/gambar_2.png',
      'views': '11 rb ditonton',
    },
    {
      'title': 'Tips Daur Ulang Sampah',
      'imagePath': 'assets/images/home_images/gambar_3.png',
      'views': '15 rb ditonton',
    },
    {
      'title': 'Pengelolaan Sampah',
      'imagePath': 'assets/images/home_images/gambar_2.png',
      'views': '9 rb ditonton',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                const SizedBox(
                  width: double.infinity,
                  height: 280,
                  child: Image(
                    image: AssetImage(
                      ImageConstant.headerImage,
                    ),
                    alignment: Alignment.bottomCenter,
                  ),
                ),
                SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 4,
                          right: 8,
                        ),
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: const Image(
                            image: AssetImage(
                              ImageConstant.logoRecythng,
                            ),
                            width: 146,
                            alignment: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        child: Container(
                          alignment: Alignment.topCenter,
                          child: Row(
                            children: [
                              const Icon(
                                Icons.account_circle_outlined,
                                size: 32,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                'Hi, Dilla',
                                style: TextStyleConstant.regularHeading4,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 24,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    top: 180,
                    right: 24,
                    left: 24,
                  ),
                  child: PointsContainer(),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const SearchBarWidget(),
            ReportSectionWidget(carouselData: carouselDataReport),
            const SizedBox(height: 12),
            const ArticleSectionWidget(),
            NewVideoSectionWidget(carouselData: carouselDataNewVideo),
            const LeaderboardSectionWidget(),
            const ChallengeSectionWidget(),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
