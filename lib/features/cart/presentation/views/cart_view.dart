import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lms/core/constants/app_router.dart';

import 'package:lms/features/cart/data/models/course_model.dart';
import 'package:lms/features/cart/presentation/widgets/cart_course_card.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        title: Text(
          "My cart",
          style: TextStyle(
            fontSize: 20,
            color:
                Theme.of(context).textTheme.bodyMedium?.color ?? Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        child: ListView.builder(
          itemCount: courses.length,
          itemBuilder: (context, index) {
            final course = courses[index];
            return Dismissible(
              key: Key(course.id),
              direction: DismissDirection.endToStart,
              background: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.red,
                ),
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Icon(Icons.delete, color: Colors.white),
              ),
              onDismissed: (direction) {
                setState(() {
                  courses.removeAt(index);
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("${course.title} removed from cart"),
                    backgroundColor: Colors.red,
                  ),
                );
              },
              child: CartCourseCard(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.checkoutPage);
                },
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
    );
  }
}
