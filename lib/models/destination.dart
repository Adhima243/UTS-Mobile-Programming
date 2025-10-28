class Destination {
  final String name;
  final String location;
  final String description;
  final String imageAsset;
  final double rating;
  final String category;
  bool isFavorite;

  Destination({
    required this.name,
    required this.location,
    required this.description,
    required this.imageAsset,
    required this.rating,
    required this.category,
    this.isFavorite = false,
  });
}
