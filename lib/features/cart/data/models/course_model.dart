class CourseModel {
  final String id;
  final String title;
  final String details;
  final String imageUrl;
  final num? price;

  CourseModel({
    this.price,
    required this.id,
    required this.title,
    required this.details,
    required this.imageUrl,
  });
}
