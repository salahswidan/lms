import 'package:flutter/material.dart';
import 'package:lms/features/courses/presentation/views/widgets/courses_view_body.dart';

class CoursesView extends StatelessWidget {
  const CoursesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: CoursesViewBody());
  }
}
