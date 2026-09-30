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
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipPath(
                  clipper: CurvePath(),
                  child: Container(
                    height: 480,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(4),
                      ),
                      image: DecorationImage(
                        image: AssetImage(product.imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 8.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                            text: "${product.name.split(" ").first}\n",
                            style: const TextStyle(
                              color: AppColors.tertiaryColor,
                              fontSize: 52,
                              height: 1.05,
                              fontFamily: Constants.primaryFont,
                            ),
                            children: [
                              TextSpan(
                                text: product.name.split(" ").length > 1
                                    ? product.name.split(" ").sublist(1).join(" ")
                                    : "",
                                style: const TextStyle(
                                  color: AppColors.accentColor,
                                  fontSize: 52,
                                  fontFamily: Constants.primaryFont,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "\$${product.price}",
                            style: const TextStyle(
                              color: AppColors.tertiaryColor,
                              fontSize: 44,
                              fontWeight: FontWeight.w600,
                              fontFamily: Constants.primaryFont,
                            ),
                          ),
                          const SizedBox(height: 24),
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
                                        : Colors.grey.shade600,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    product.description,
                    style: TextStyle(
                      color: AppColors.tertiaryColor.withValues(alpha: 0.9),
                      fontSize: 16,
                      height: 1.5,
                      fontFamily: Constants.secondaryFont,
                    ),
                  ),
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
          SafeArea(
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                margin: const EdgeInsets.all(16),
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryColor.withValues(alpha: 0.85),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.2),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: const Icon(Icons.arrow_back_rounded, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  height: 56,
                  color: AppColors.accentColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: const Text(
                    "BUY NOW",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                      fontFamily: Constants.secondaryFont,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Container(
                height: 56,
                width: 56,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Icon(
                  Icons.bookmark_border_outlined,
                  color: Colors.grey.shade800,
                  size: 26,
                ),
              ),
            ],
          ),
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
    path.lineTo(0, h * 0.88);
    path.quadraticBezierTo(
      size.width * 0.5,
      size.height,
      size.width,
      size.height * 0.88,
    );
    path.lineTo(w, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
