import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/screens/article/article_detail/article_detail_screen.dart';
import 'package:recything_application/widgets/global_search_bar.dart';

class ArticleListScreen extends StatefulWidget {
  const ArticleListScreen({super.key});

  @override
  State<ArticleListScreen> createState() => _ArticleListScreenState();
}

class _ArticleListScreenState extends State<ArticleListScreen> {
  List<Widget> menuWidget = [
    Text('Semua'),
    Text('Tips'),
    Text('Tutorial'),
    Text('Kampanye'),
    Text('Daur Ulang'),
  ];

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            top: 16,
            right: 16,
            bottom: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.symmetric(horizontal: 5.5),
                height: 40,
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.arrow_back,
                      size: 24,
                    ),
                    SpacingConstant.horizontalSpacing300,
                    const Expanded(
                      child: GlobalSearchBar(
                        prefixIcon: Icon(Icons.search),
                        hintText: "Search",
                        height: 40,
                        width: double.infinity,
                      ),
                    )
                  ],
                ),
              ),
              SpacingConstant.verticalSpacing300,
              DefaultTabController(
                initialIndex: index,
                length: 5,
                child: Container(
                  color: ColorConstant.whiteColor,
                  height: 42,
                  width: double.infinity,
                  child: TabBar(
                    labelStyle: TextStyleConstant.boldParagraph.copyWith(
                      fontSize: 16,
                    ),
                    unselectedLabelStyle: TextStyleConstant.boldParagraph
                        .copyWith(fontWeight: FontWeight.w400),
                    unselectedLabelColor: ColorConstant.netralColor900,
                    tabAlignment: TabAlignment.start,
                    labelColor: ColorConstant.secondaryColor500,
                    indicatorColor: ColorConstant.secondaryColor500,
                    dividerHeight: 0,
                    onTap: (value) {
                      setState(() {
                        index = value;
                      });
                    },
                    isScrollable: true,
                    tabs: [
                      Tab(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text("Semua"),
                        ),
                      ),
                      Tab(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text("Tips"),
                        ),
                      ),
                      Tab(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text("Tutorial"),
                        ),
                      ),
                      Tab(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text("Kampanye"),
                        ),
                      ),
                      Tab(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text("Daur Ulang"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SpacingConstant.verticalSpacing300,
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.5, right: 8.5),
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const Padding(
                      padding: EdgeInsets.only(
                        bottom: 16,
                        top: 7,
                      ),
                      child: Divider(
                        color: ColorConstant.netralColor500,
                      ),
                    ),
                    itemCount: 3,
                    itemBuilder: (context, index) => GestureDetector(
                        onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ArticleDetailScreen(),
                              ),
                            ),
                        child: Container(
                          height: 120,
                          width: double.infinity,
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 16,
                                          child: Icon(Icons.person),
                                        ),
                                        SpacingConstant.horizontalSpacing100,
                                        Text('Full Name'),
                                      ],
                                    ),
                                    SpacingConstant.verticalSpacing100,
                                    Text(
                                      "Tips Memilah Sampah Organik & Anorganik",
                                      style: TextStyleConstant.boldParagraph
                                          .copyWith(
                                        color: ColorConstant.netralColor900,
                                      ),
                                    ),
                                    SpacingConstant.verticalSpacing100,
                                    Text(
                                      "Tips untuk kalian yang baru mulai.",
                                      style: TextStyleConstant.regularFooter
                                          .copyWith(
                                        color: ColorConstant.netralColor900,
                                      ),
                                    ),
                                    Text(
                                      "26 Mar 2024.",
                                      style: TextStyleConstant.regularFooter
                                          .copyWith(
                                        color: ColorConstant.netralColor900,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: ColorConstant.netralColor500,
                                  ),
                                  child: Icon(Icons.error),
                                ),
                              ),
                            ],
                          ),
                        )),
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
