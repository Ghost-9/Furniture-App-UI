import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/consts.dart';

class ProductView extends StatelessWidget {
  final String imagePath, collectionName, price;
  final bool? isBookmarked;
  final VoidCallback? onPressed;
  final VoidCallback? onProductTap;

  const ProductView({
    super.key,
    required this.imagePath,
    required this.collectionName,
    required this.price,
    this.onPressed,
    this.isBookmarked = false,
    this.onProductTap,
  });

  @override
  Widget build(BuildContext context) {
    final nameParts = collectionName.split(" ");
    final firstName = nameParts.first;
    final lastName = nameParts.length > 1 ? nameParts.sublist(1).join(" ") : "";

    return GestureDetector(
      onTap: onProductTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.tertiaryColor,
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.15),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  margin: const EdgeInsets.all(8),
                  height: 38,
                  width: 38,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withValues(alpha: 0.9),
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: onPressed,
                    icon: Icon(
                      (isBookmarked ?? false)
                          ? Icons.bookmark
                          : Icons.bookmark_border_rounded,
                      size: 20,
                      color: (isBookmarked ?? false)
                          ? Colors.black
                          : Colors.grey.shade600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    lastName.isNotEmpty ? "$firstName\n$lastName" : firstName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontFamily: Constants.secondaryFont,
                      fontSize: 15,
                      height: 1.2,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  "\$$price",
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: Constants.secondaryFont,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
