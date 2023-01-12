import 'package:flutter/material.dart';
import 'package:furniture_app_ui/models/collection_model.dart';

import '../utils/colors.dart';
import '../utils/consts.dart';
import '../utils/mock.dart';
import '../widgets/product_view.dart';

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
                        .headline1!
                        .copyWith(color: AppColors.accentColor, fontSize: 60),
                    children: [
                      TextSpan(
                          text: "COLLECTION",
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
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
                              .bodyText1!
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
                                    .bodyText1!
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

class CollectionDetailPage extends StatefulWidget {
  final CollectionModel collectionType;
  const CollectionDetailPage({super.key, required this.collectionType});

  @override
  State<CollectionDetailPage> createState() => _CollectionDetailPageState();
}

class _CollectionDetailPageState extends State<CollectionDetailPage> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            PageView.builder(
                itemCount: widget.collectionType.collectionProducts.length,
                scrollDirection: Axis.horizontal,
                physics: const ClampingScrollPhysics(),
                onPageChanged: (val) {
                  setState(() {
                    pageIndex = val;
                  });
                },
                itemBuilder: ((context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(widget.collectionType
                                .collectionProducts[index].imagePath),
                            fit: BoxFit.cover)),
                  );
                })),
            Align(
              alignment: Alignment.topLeft,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 30,
                      )),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 375),
                    margin: const EdgeInsets.only(top: 150),
                    padding: const EdgeInsets.all(10),
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.tertiaryColor.withOpacity(0.8)),
                    child: Center(
                        child: Text.rich(TextSpan(
                            text:
                                "${widget.collectionType.collectionProducts[pageIndex].name}\n",
                            style: const TextStyle(
                                color: AppColors.secondaryColor,
                                fontSize: 18,
                                fontFamily: Constants.secondaryFont),
                            children: [
                          TextSpan(
                              text: widget.collectionType.name,
                              style: const TextStyle(
                                  color: AppColors.secondaryColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: Constants.secondaryFont))
                        ]))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 40,
                    width: 80,
                    margin: const EdgeInsets.only(left: 70),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: AppColors.accentColor),
                    child: Center(
                      child: Text(
                        "\$${widget.collectionType.collectionProducts[pageIndex].price}",
                        style:
                            const TextStyle(fontSize: 26, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 30,
                    width: 30,
                    margin: const EdgeInsets.only(left: 80),
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.accentColor)),
                  ),
                ],
              ),
            ),
          ],
        ),
        extendBody: true,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 16.0),
          child: Container(
            height: 80,
            decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(15)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(
                      Icons.home_filled,
                      color: Colors.white,
                    )),
                FloatingActionButton(
                  backgroundColor: Colors.white,
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductDetailsPage(
                            product: widget
                                .collectionType.collectionProducts[pageIndex],
                          ))),
                  child: const Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.person,
                      color: Colors.white,
                    )),
              ],
            ),
          ),
        ));
  }
}

class ProductDetailsPage extends StatelessWidget {
  final CollectionDetailsModel product;
  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipPath(
                clipper: CurvePath(),
                child: Container(
                  height: 500,
                  decoration: BoxDecoration(
                    borderRadius:
                        const BorderRadius.vertical(bottom: Radius.circular(4)),
                    image: DecorationImage(
                      image: AssetImage(product.imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(
                      TextSpan(
                          text: "${product.name.split(" ").first}\n",
                          style: const TextStyle(
                              color: AppColors.tertiaryColor,
                              fontSize: 60,
                              fontFamily: Constants.primaryFont),
                          children: [
                            TextSpan(
                                text: product.name.split(" ").last,
                                style: const TextStyle(
                                    color: AppColors.accentColor,
                                    fontSize: 60,
                                    fontFamily: Constants.primaryFont))
                          ]),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("\$${product.price}",
                            style: const TextStyle(
                                color: AppColors.tertiaryColor,
                                fontSize: 50,
                                fontFamily: Constants.primaryFont)),
                        const SizedBox(
                          height: 40,
                        ),
                        SizedBox(
                          height: 6,
                          child: ListView.builder(
                              itemCount: 4,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Container(
                                    width: index == 3 ? 20 : 14,
                                    margin: const EdgeInsets.only(right: 4),
                                    decoration: BoxDecoration(
                                        color: index == 3
                                            ? AppColors.tertiaryColor
                                            : Colors.grey,
                                        borderRadius:
                                            BorderRadius.circular(10)));
                              }),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  product.description,
                  style: const TextStyle(
                      color: AppColors.tertiaryColor,
                      fontSize: 18,
                      fontFamily: Constants.secondaryFont),
                ),
              ),
            ],
          ),
          SafeArea(
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                margin: const EdgeInsets.all(16),
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: AppColors.primaryColor),
                child:
                    const Icon(Icons.arrow_back_rounded, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MaterialButton(
              onPressed: () {},
              height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 100),
              color: AppColors.accentColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18)),
              child: const Text(
                "BUY NOW",
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: Constants.secondaryFont),
              ),
            ),
            Container(
              height: 60,
              width: 50,
              decoration: const BoxDecoration(
                  color: Colors.white, shape: BoxShape.circle),
              child: Icon(
                Icons.bookmark_border_outlined,
                color: Colors.grey.shade700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CurvePath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double h = size.height;
    double w = size.width;

    Path path = Path();
    path.lineTo(0, h * 0.85);
    path.quadraticBezierTo(
        size.width * 0.5, size.height, size.width, size.height * 0.85);
    path.lineTo(w, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
