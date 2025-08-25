import '../../domain/entities/course.dart';

class CourseModel {
  final String id;
  final String title;
  final String tutor;
  final double price;
  final double rating;
  final String imageUrl;
  final String categoryId;

  const CourseModel({
    required this.id,
    required this.title,
    required this.tutor,
    required this.price,
    required this.rating,
    required this.imageUrl,
    required this.categoryId,
  });

  factory CourseModel.fromMap(Map<String, dynamic> map) {
    return CourseModel(
      id: map['id'] as String,
      title: map['title'] as String,
      tutor: map['tutor'] as String,
      price: (map['price'] as num).toDouble(),
      rating: (map['rating'] as num).toDouble(),
      imageUrl: map['imageUrl'] as String,
      categoryId: map['categoryId'] as String,
    );
  }

  Course toEntity() => Course(
        id: id,
        title: title,
        tutor: tutor,
        price: price,
        rating: rating,
        imageUrl: imageUrl,
        categoryId: categoryId,
      );
}
