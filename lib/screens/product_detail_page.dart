import 'package:flutter/material.dart';

import '../models/collection_detail_model.dart';
import '../utils/colors.dart';
import '../utils/consts.dart';

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
