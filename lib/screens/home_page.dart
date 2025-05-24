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
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints.tight(const Size(16, 60)),
                  icon: const Icon(
                    Icons.search,
                    color: AppColors.tertiaryColor,
                  ),
                  onPressed: () {},
                ),
              ),
              Positioned(
                left: 60,
                top: 4,
                child: Text.rich(TextSpan(
                    text: "NEW\n",
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(color: AppColors.accentColor, fontSize: 60),
                    children: [
                      TextSpan(
                          text: "COLLECTION",
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                  color: AppColors.tertiaryColor,
                                  fontSize: 60)),
                    ])),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints.tight(const Size(10, 60)),
                    visualDensity: VisualDensity.compact,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.menu,
                      color: AppColors.tertiaryColor,
                    )),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.18,
                child: DefaultTabController(
                  length: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(TextSpan(
                          text:
                              "The new Flexform outdoor collection is\npermeated with fresh, inventive style and\npioneering design research.",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color: AppColors.tertiaryColor,
                                  fontSize: 20,
                                  wordSpacing: 4,
                                  overflow: TextOverflow.ellipsis,
                                  fontFamily: Constants.secondaryFont),
                          children: [
                            TextSpan(
                                text: " Read More",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        color: AppColors.tertiaryColor,
                                        fontSize: 20,
                                        overflow: TextOverflow.ellipsis,
                                        decoration: TextDecoration.underline,
                                        fontFamily: Constants.secondaryFont))
                          ])),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        child: const TabBar(
                            isScrollable: true,
                            indicatorSize: TabBarIndicatorSize.label,
                            indicatorColor: AppColors.tertiaryColor,
                            tabs: [
                              Tab(
                                iconMargin: EdgeInsets.zero,
                                child: Text(
                                  "All",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: Constants.secondaryFont),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  "Brands",
                                  style: TextStyle(
                                      color: AppColors.tertiaryColor,
                                      fontSize: 16,
                                      fontFamily: Constants.secondaryFont),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  "Tops",
                                  style: TextStyle(
                                      color: AppColors.tertiaryColor,
                                      fontSize: 16,
                                      fontFamily: Constants.secondaryFont),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  "Modern",
                                  style: TextStyle(
                                      color: AppColors.accentColor,
                                      fontSize: 16,
                                      fontFamily: Constants.secondaryFont),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  "Sale",
                                  style: TextStyle(
                                      color: AppColors.tertiaryColor,
                                      fontSize: 16,
                                      fontFamily: Constants.secondaryFont),
                                ),
                              ),
                            ]),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.6,
                        width: MediaQuery.of(context).size.width - 32,
                        child: TabBarView(
                            children: List.generate(
                          5,
                          (index) => Container(
                            height: 300,
                            width: 300,
                            color: AppColors.primaryColor,
                            child: GridView.builder(
                              itemCount: mockData.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10,
                                      childAspectRatio: 2,
                                      mainAxisExtent: 340),
                              itemBuilder: ((context, index) {
                                return index.isOdd
                                    ? Padding(
                                        padding:
                                            const EdgeInsets.only(top: 20.0),
                                        child: ProductView(
                                          onProductTap: () =>
                                              Navigator.of(context)
                                                  .push(MaterialPageRoute(
                                            builder: (context) =>
                                                CollectionDetailPage(
                                                    collectionType:
                                                        mockData[index]),
                                          )),
                                          onPressed: () {
                                            setState(() {
                                              mockData[index].isBookmarked =
                                                  !mockData[index].isBookmarked;
                                            });
                                          },
                                          imagePath: mockData[index].imagePath,
                                          collectionName: mockData[index].name,
                                          price: mockData[index].price,
                                          isBookmarked:
                                              mockData[index].isBookmarked,
                                        ),
                                      )
                                    : ProductView(
                                        onProductTap: () =>
                                            Navigator.of(context)
                                                .push(MaterialPageRoute(
                                          builder: (context) =>
                                              CollectionDetailPage(
                                                  collectionType:
                                                      mockData[index]),
                                        )),
                                        onPressed: () {
                                          setState(() {
                                            mockData[index].isBookmarked =
                                                !mockData[index].isBookmarked;
                                          });
                                        },
                                        imagePath: mockData[index].imagePath,
                                        collectionName: mockData[index].name,
                                        price: mockData[index].price,
                                        isBookmarked:
                                            mockData[index].isBookmarked,
                                      );
                              }),
                            ),
                          ),
                        )),
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
