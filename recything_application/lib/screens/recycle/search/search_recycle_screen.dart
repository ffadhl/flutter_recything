import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/controllers/recycle_controller.dart';
import 'package:recything_application/screens/recycle/search/widgets/app_bar_search_recycle_widget.dart';
import 'package:recything_application/screens/recycle/search/widgets/current/article_current_search_recycle_widget.dart';
import 'package:recything_application/screens/recycle/search/widgets/current/video_current_search_recycle_widget.dart';
import 'package:recything_application/screens/recycle/search/widgets/history_search_recycle_widget.dart';
import 'package:recything_application/screens/recycle/search/widgets/newest/newest_search_recycle_widget.dart';
import 'package:recything_application/screens/recycle/search/widgets/recommendation_search_recycle_widget.dart';

class SearchRecycleScreen extends StatelessWidget {
  const SearchRecycleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final RecycleController controller = Get.find();
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      body: Stack(
        children: [Column(
          children: [
            const AppBarSearchRecycleWidget(),
            Obx(
              () {
                return Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SpacingConstant.verticalSpacing150,
                        const HistorySearchRecycleWidget(),
                        SpacingConstant.verticalSpacing250,
                        if (controller.searchHistory.isEmpty) ...[
                          const RecommendationSearchRecycleWidget(),
                          SpacingConstant.verticalSpacing250,
                          const NewestSearchRecycleWidget(),
                        ] else ...[
                          const VideoCurrentSearchRecycleWidget(),
                          SpacingConstant.verticalSpacing250,
                          const ArticleCurrentSearchRecycleWidget(),
                        ],
                        SpacingConstant.verticalSpacing150,
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),],
      ),
    );
  }
}
