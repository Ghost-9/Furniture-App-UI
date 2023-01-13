class CollectionDetailsModel {
  final String name, price, description, imagePath;
  bool isBookmarked;
  CollectionDetailsModel({
    required this.name,
    required this.price,
    required this.description,
    required this.imagePath,
    this.isBookmarked = false,
  });
}
