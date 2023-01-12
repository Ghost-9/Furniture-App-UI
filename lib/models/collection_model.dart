class CollectionModel {
  final String name, price, description, imagePath;
  bool isBookmarked;
  final List<CollectionDetailsModel> collectionProducts;
  CollectionModel(
      {required this.name,
      required this.price,
      required this.description,
      required this.imagePath,
      required this.collectionProducts,
      this.isBookmarked = false});
}

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
