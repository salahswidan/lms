import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/features/cart/data/models/course_model.dart';
import 'package:lms/features/cart/presentation/widgets/cart_course_card.dart';
import '../cubit/check_out_cubit.dart';
import '../cubit/check_out_state.dart';
import '../widgets/check_out_button.dart';
import '../widgets/coupon_input.dart';
import '../widgets/total_price.dart';

class CheckoutScreen extends StatelessWidget {
  final List<Map<String, dynamic>> courses;

  const CheckoutScreen({super.key, required this.courses});

  @override
  Widget build(BuildContext context) {
    final couponController = TextEditingController();
    List<CourseModel> courses = [
      CourseModel(
        price: 49.99,
        id: "101",
        title: "Introduction to Data Science",
        details:
            "This course provides a comprehensive introduction to data science, covering essential concepts and techniques.",
        imageUrl:
            "https://img.freepik.com/premium-vector/e-learning-online-courses-video-web-banner-thumbnail-design_673898-399.jpg",
      ),
      CourseModel(
        price: 39.99,
        id: "102",
        title: "Flutter Development",
        details:
            "Learn to build mobile apps with Flutter from scratch using Dart.",
        imageUrl:
            "https://img.freepik.com/free-vector/mobile-app-development-illustration_52683-47931.jpg",
      ),
    ];

    return BlocProvider(
      create: (_) => CheckoutCubit(courses),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Checkout",
            style: TextStyle(
              fontSize: 20,
              color:
                  Theme.of(context).textTheme.bodyMedium?.color ?? Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Your Courses:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              Expanded(
                child: BlocBuilder<CheckoutCubit, CheckoutState>(
                  builder: (context, state) {
                    return ListView.separated(
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                      itemCount: state.courses.length,
                      itemBuilder: (context, index) => CartCourseCard(
                        id: courses[index].id,
                        title: courses[index].title,
                        details: courses[index].details,
                        imageUrl: courses[index].imageUrl,
                        price: courses[index].price.toString(),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              CouponField(controller: couponController),
              const SizedBox(height: 20),
              const TotalPriceWidget(),
              const SizedBox(height: 20),
              const CheckoutButton(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
