import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lms/core/constants/app_text_styles.dart';
import 'package:lms/core/cubits/course_cubit/course_cubit.dart';
import 'package:lms/features/course_details/presentation/cubit/course_details_cubit.dart';
import 'package:lms/features/courses/domain/entities/course_entity.dart';

class CourseDetailsViewBody extends StatefulWidget {
  const CourseDetailsViewBody({super.key, required this.id});

  final String id;

  @override
  State<CourseDetailsViewBody> createState() => _CourseDetailsViewBodyState();
}

class _CourseDetailsViewBodyState extends State<CourseDetailsViewBody> {
  @override
  void initState() {
    context.read<CourseCubit>().getCourseDetails(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final courseDetailsCubit = context.read<CourseDetailsCubit>();

    CourseEntity? course;

    return BlocConsumer<CourseCubit, CourseState>(
      listener: (context, state) {
        if (state is CourseFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
        if (state is CourseDetailsSuccess) {
          course = state.courseEntity;
        }
      },
      builder: (context, state) {
        return state is CourseLoading
            ? Center(child: CircularProgressIndicator())
            : CustomScrollView(
                slivers: [
                  SliverAppBar(
                    expandedHeight: 240,
                    floating: false,
                    pinned: true,
                    backgroundColor: Colors.transparent,
                    leading: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () => GoRouter.of(context).pop(),
                        child: CircleAvatar(
                          backgroundColor: Colors.white70,
                          child: const Icon(
                            Icons.arrow_back,
                            color: Color(0xFF64748B),
                          ),
                        ),
                      ),
                    ),
                    flexibleSpace: FlexibleSpaceBar(
                      background: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.network(
                            course!.thumbnailUrl,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.black54, Colors.transparent],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            course!.title,
                            style: AppTextStyles.titleLarge.copyWith(
                              color: Color(0xFF1E293B),
                            ),
                          ),
                          const SizedBox(height: 16),
                          // InstructorInfo(
                          //   imageUrl:
                          //       'https://lh3.googleusercontent.com/aida-public/AB6AXuD5u3B2wT-KGtn7JOBfa3zWKxLe-OG8wSQt0IWyUgptlnm_op8vu_BmFm5wDppmzA_k01OFunv5S99lOuLc1vyr4t0bVI8sM5o0ReEvaniJgRh94u0xR77El0NJ8mMjuvPIS9AsHYy7Pv5YnX74pzPt_nr3YVEvF5ynbYOmCD7-Eyk6j60H39_NiRRDhkt7hxESovAJ_MPZqruIx4wzysX_mf-vPMBUpxf_4Mg7RtHHzJX9FqrvqnTrU4MBGHeyP1dlQHJWFzS9gAjJ',
                          //   name: 'Dr. Evelyn Reed',
                          //   subtitle: 'Data Science Expert',
                          // ),
                          const SizedBox(height: 16),
                          Text(
                            course!.description,
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: Color(0xFF64748B),
                            ),
                          ),
                          const SizedBox(height: 32),
                          Text(
                            'Course Content',
                            style: AppTextStyles.titleLarge.copyWith(
                              color: Color(0xFF1E293B),
                              fontSize: 18.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.only(left: 20, right: 20, bottom: 24),
                    sliver: SliverList.builder(
                      itemCount: course!.modules.length,
                      itemBuilder: (context, index) {
                        final module = course!.modules[index];
                        // return ModuleTile(
                        //   title: 'Module ${index + 1}: ${module.title}',
                        //   lessons: List.generate(module.lessons.length, (
                        //     lessonIndex,
                        //   ) {
                        //     final lesson = module.lessons[lessonIndex];
                        //     return BlocBuilder<
                        //       CourseDetailsCubit,
                        //       CourseDetailsState
                        //     >(
                        //       builder: (context, state) => GestureDetector(
                        //         onTap: () => courseDetailsCubit
                        //             .openYouTubeVideo(lesson.videoUrl),
                        //         child: LessonTile(
                        //           toggleComplete: () =>
                        //               courseDetailsCubit.toggleComplete(lesson),
                        //           title: lesson.title,
                        //           subtitle: '${lesson.minutes} min',
                        //           icon: Icons.play_arrow_rounded,
                        //           backgroundColor: Color(0xFFE0F2FE),
                        //           iconColor: Color(0xFF0C77F2),
                        //           isCompleted: lesson.isCompleted,
                        //         ),
                        //       ),
                        //     );
                        //   }),
                        // );
                      },
                    ),
                  ),
                ],
              );
      },
    );
  }
}
