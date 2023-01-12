import 'package:flutter/material.dart';
import 'package:furniture_app_ui/colors.dart';
import 'package:furniture_app_ui/consts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: Constants.primaryFont,
      ),
      home: const HomePage(),
    );
  }
}

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

List<CollectionModel> mockData = [
  CollectionModel(
    name: "Scarlet Collection",
    price: "180",
    description: "",
    imagePath: "assets/images/0.jpg",
  ),
  CollectionModel(
      name: "Lindsi Collection",
      price: "300",
      description: "",
      imagePath: "assets/images/1.jpg"),
  CollectionModel(
      name: "Batra Collection",
      price: "999",
      description: "A range of premium monochromatic furniture",
      imagePath: "assets/images/2.jpg"),
  CollectionModel(
      name: "Youve Collection",
      price: "350",
      description: "",
      imagePath: "assets/images/3.jpg"),
  CollectionModel(
      name: "Sattire Collection",
      price: "380",
      description: "",
      imagePath: "assets/images/3.jpg"),
];

class CollectionModel {
  String name, price, description, imagePath;
  bool isBookmarked;
  CollectionModel(
      {required this.name,
      required this.price,
      required this.description,
      required this.imagePath,
      this.isBookmarked = false});
}

class ProductView extends StatelessWidget {
  final String imagePath, collectionName, price;
  final bool? isBookmarked;
  final Function()? onPressed;

  const ProductView(
      {super.key,
      required this.imagePath,
      required this.collectionName,
      required this.price,
      this.onPressed,
      this.isBookmarked = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 250,
          width: 180,
          margin: EdgeInsets.zero,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColors.tertiaryColor,
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: const EdgeInsets.all(8),
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: IconButton(
                  onPressed: onPressed,
                  icon: Icon(
                    isBookmarked ?? false
                        ? Icons.bookmark
                        : Icons.bookmark_border_rounded,
                    color: isBookmarked! ? Colors.black : Colors.grey,
                  )),
            ),
          ),
        ),
        SizedBox(
          width: 180,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    "${collectionName.split(" ").first}\n${collectionName.split(" ").last}",
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                        color: Colors.grey,
                        fontFamily: Constants.secondaryFont,
                        fontSize: 18,
                        fontWeight: FontWeight.w500)),
                Text(
                  "\$$price",
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                      color: Colors.white,
                      fontFamily: Constants.secondaryFont,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
