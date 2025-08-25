
import 'package:lms/features/cart/data/models/course_model.dart';

class CheckoutState {
  final List<CourseModel> courses;
  final double discountPercent;

  CheckoutState({
    required this.courses,
    required this.discountPercent,
  });

  double get totalPrice {
    double sum = courses.fold(0, (acc, course) => acc + course.price!);
    return sum - (sum * discountPercent);
  }

  CheckoutState copyWith({
    List<CourseModel>? courses,
    double? discountPercent,
  }) {
    return CheckoutState(
      courses: courses ?? this.courses,
      discountPercent: discountPercent ?? this.discountPercent,
    );
  }
}
