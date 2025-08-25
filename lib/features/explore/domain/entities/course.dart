class Course {
  final String id;
  final String title;
  final String tutor;
  final double price;
  final double rating;
  final String imageUrl;
  final String categoryId;

  const Course({
    required this.id,
    required this.title,
    required this.tutor,
    required this.price,
    required this.rating,
    required this.imageUrl,
    required this.categoryId,
  });
}
