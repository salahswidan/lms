
class CheckoutState {
  final List<Map<String, dynamic>> courses;
  final double discountPercent;

  CheckoutState({
    required this.courses,
    required this.discountPercent,
  });

  double get totalPrice {
    double sum = courses.fold(0, (acc, course) => acc + course['price']);
    return sum - (sum * discountPercent);
  }

  CheckoutState copyWith({
    List<Map<String, dynamic>>? courses,
    double? discountPercent,
  }) {
    return CheckoutState(
      courses: courses ?? this.courses,
      discountPercent: discountPercent ?? this.discountPercent,
    );
  }
}
