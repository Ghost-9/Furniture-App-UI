import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/consts.dart';
import '../utils/mock.dart';
import '../widgets/product_view.dart';
import 'collection_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Bar: Menu, Title & Search
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: const Icon(
                      Icons.menu,
                      color: AppColors.tertiaryColor,
                      size: 28,
                    ),
                    onPressed: () {},
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text.rich(
                        TextSpan(
                          text: "NEW\n",
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                                color: AppColors.accentColor,
                                fontSize: 48,
                                height: 0.95,
                                fontFamily: Constants.primaryFont,
                              ),
                          children: [
                            TextSpan(
                              text: "COLLECTION",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
                                    color: AppColors.tertiaryColor,
                                    fontSize: 48,
                                    height: 0.95,
                                    fontFamily: Constants.primaryFont,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: const Icon(
                      Icons.search,
                      color: AppColors.tertiaryColor,
                      size: 28,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Description
              Text.rich(
                TextSpan(
                  text:
                      "The new Flexform outdoor collection is permeated with fresh, inventive style and pioneering design research.",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: AppColors.tertiaryColor.withValues(alpha: 0.9),
                        fontSize: 15,
                        height: 1.4,
                        fontFamily: Constants.secondaryFont,
                      ),
                  children: [
                    TextSpan(
                      text: " Read More",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: AppColors.tertiaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                            fontFamily: Constants.secondaryFont,
                          ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Tab Controller & Product Grid
              Expanded(
                child: DefaultTabController(
                  length: 5,
                  child: Column(
                    children: [
                      const TabBar(
                        isScrollable: true,
                        tabAlignment: TabAlignment.start,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorColor: AppColors.tertiaryColor,
                        dividerColor: Colors.transparent,
                        labelPadding: EdgeInsets.symmetric(horizontal: 16),
                        tabs: [
                          Tab(
                            child: Text(
                              "All",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontFamily: Constants.secondaryFont,
                              ),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Brands",
                              style: TextStyle(
                                color: AppColors.tertiaryColor,
                                fontSize: 16,
                                fontFamily: Constants.secondaryFont,
                              ),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Tops",
                              style: TextStyle(
                                color: AppColors.tertiaryColor,
                                fontSize: 16,
                                fontFamily: Constants.secondaryFont,
                              ),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Modern",
                              style: TextStyle(
                                color: AppColors.accentColor,
                                fontSize: 16,
                                fontFamily: Constants.secondaryFont,
                              ),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Sale",
                              style: TextStyle(
                                color: AppColors.tertiaryColor,
                                fontSize: 16,
                                fontFamily: Constants.secondaryFont,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Expanded(
                        child: TabBarView(
                          children: List.generate(
                            5,
                            (tabIdx) => GridView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: mockData.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 12,
                                mainAxisExtent: 330,
                              ),
                              itemBuilder: (context, index) {
                                final isOffset = index.isOdd;
                                return Padding(
                                  padding: EdgeInsets.only(
                                    top: isOffset ? 20.0 : 0.0,
                                    bottom: isOffset ? 0.0 : 20.0,
                                  ),
                                  child: ProductView(
                                    onProductTap: () =>
                                        Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            CollectionDetailPage(
                                          collectionType: mockData[index],
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        mockData[index].isBookmarked =
                                            !mockData[index].isBookmarked;
                                      });
                                    },
                                    imagePath: mockData[index].imagePath,
                                    collectionName: mockData[index].name,
                                    price: mockData[index].price,
                                    isBookmarked: mockData[index].isBookmarked,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
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
