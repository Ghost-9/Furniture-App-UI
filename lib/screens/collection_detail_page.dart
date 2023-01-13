import 'package:flutter/material.dart';

import '../models/collection_model.dart';
import '../utils/colors.dart';
import '../utils/consts.dart';
import 'product_detail_page.dart';

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
