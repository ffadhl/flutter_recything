import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/image_constant.dart';
import 'package:recything_application/constants/shadow_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';

class ArticleSectionWidget extends StatelessWidget {
  const ArticleSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 24,
        left: 24,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Artikel Terbaru',
                    style: TextStyleConstant.boldSubtitle,
                  ),
                  Text(
                    'Yuk Baca Artikel Terbaru Disini!',
                    style: TextStyleConstant.regularParagraph,
                  ),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Lihat Semua',
                  style: TextStyleConstant.semiboldCaption.copyWith(
                    color: ColorConstant.primaryColor500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 200,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    width: 356,
                    height: 148,
                    decoration: BoxDecoration(
                      color: ColorConstant.whiteColor,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: ShadowConstant.shadowLg,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 180,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/home_images/avatar1.png',
                                      width: 24,
                                    ),
                                    const SizedBox(width: 12),
                                    Text(
                                      'Kania Dekoruma',
                                      style: TextStyleConstant.mediumFooter,
                                    ),
                                  ],
                                ),
                                Text(
                                  'Jangan Sembarangan, Begini Cara Mengolah...',
                                  style: TextStyleConstant.boldParagraph,
                                ),
                                Text(
                                  'Tips untuk kalian yang baru mulai.',
                                  style: TextStyleConstant.mediumFooter,
                                ),
                                Text(
                                  '26 Maret 2024',
                                  style: TextStyleConstant.mediumFooter,
                                ),
                                const SizedBox(width: 8),
                              ],
                            ),
                          ),
                          Image.asset(
                            ImageConstant.gambar7,
                            width: 148,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Container(
                    width: 356,
                    height: 148,
                    decoration: BoxDecoration(
                      color: ColorConstant.whiteColor,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: ShadowConstant.shadowLg,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 180,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/home_images/avatar2.png',
                                      width: 24,
                                    ),
                                    const SizedBox(width: 12),
                                    Text(
                                      'Loka Tresna',
                                      style: TextStyleConstant.mediumFooter,
                                    ),
                                  ],
                                ),
                                Text(
                                  'Tips Memilah Sampah Organik & Anorganik',
                                  style: TextStyleConstant.boldParagraph,
                                ),
                                Text(
                                  'Tips untuk kalian yang baru mulai.',
                                  style: TextStyleConstant.mediumFooter,
                                ),
                                Text(
                                  '26 Maret 2024',
                                  style: TextStyleConstant.mediumFooter,
                                ),
                              ],
                            ),
                          ),
                          Image.asset(
                            ImageConstant.gambar8,
                            width: 148,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
