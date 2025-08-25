import 'package:flutter/material.dart';
import 'package:lms/features/course_details/presentation/views/widgets/course_details_view_body.dart';

class CourseDetailsView extends StatelessWidget {
  const CourseDetailsView({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: CourseDetailsViewBody(id: id));
  }
}
