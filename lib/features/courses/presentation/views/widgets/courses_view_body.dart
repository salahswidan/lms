import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:lms/core/constants/app_router.dart';
import 'package:lms/core/cubits/course_cubit/course_cubit.dart';
import 'package:lms/features/courses/domain/entities/course_entity.dart';

import '../../../../../core/constants/app_paddings.dart';
import '../../../../../core/constants/app_text_styles.dart';

import 'course_card.dart';

class CoursesViewBody extends StatefulWidget {
  const CoursesViewBody({super.key});

  @override
  State<CoursesViewBody> createState() => _CoursesViewBodyState();
}

class _CoursesViewBodyState extends State<CoursesViewBody> {
  @override
  void initState() {
    context.read<CourseCubit>().getCourses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<CourseEntity> courses = [];
    return SafeArea(
      child: Padding(
        padding: AppPaddings.screen,
        child: BlocConsumer<CourseCubit, CourseState>(
          listener: (context, state) {
            if (state is CourseFailure) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
            if (state is CourseSuccess) {
              courses.addAll(state.courses);
            }
          },
          builder: (context, state) {
            return state is CourseLoading
                ? Center(child: CircularProgressIndicator())
                : CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage(
                                    'assets/images/personal-image.png',
                                  ),
                                  radius: 24.0,
                                ),
                                SizedBox(width: 16.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Welcome back,',
                                      style: AppTextStyles.body,
                                    ),
                                    Text(
                                      'Ahmed',
                                      style: AppTextStyles.headingMedium,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 64.0),
                            Text(
                              'Your Courses',
                              style: AppTextStyles.headingLarge,
                            ),
                            SizedBox(height: 16.0),
                          ],
                        ),
                      ),
                      SliverList.builder(
                        itemCount: courses.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              GoRouter.of(context).push(
                                AppRouter.courseDetailsPage,
                                extra: courses[index].id,
                              );
                            },
                            child: CourseCard(courseEntity: courses[index]),
                          );
                        },
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }
}
