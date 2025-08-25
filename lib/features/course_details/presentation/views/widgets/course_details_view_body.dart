import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1E293B),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 20,
                                backgroundImage: NetworkImage(
                                  'https://lh3.googleusercontent.com/aida-public/AB6AXuD5u3B2wT-KGtn7JOBfa3zWKxLe-OG8wSQt0IWyUgptlnm_op8vu_BmFm5wDppmzA_k01OFunv5S99lOuLc1vyr4t0bVI8sM5o0ReEvaniJgRh94u0xR77El0NJ8mMjuvPIS9AsHYy7Pv5YnX74pzPt_nr3YVEvF5ynbYOmCD7-Eyk6j60H39_NiRRDhkt7hxESovAJ_MPZqruIx4wzysX_mf-vPMBUpxf_4Mg7RtHHzJX9FqrvqnTrU4MBGHeyP1dlQHJWFzS9gAjJ',
                                ),
                              ),
                              const SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Dr. Evelyn Reed',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF1E293B),
                                    ),
                                  ),
                                  Text(
                                    'Data Science Expert',
                                    style: TextStyle(
                                      color: Color(0xFF64748B),
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            course!.description,
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF64748B),
                            ),
                          ),
                          const SizedBox(height: 32),
                          const Text(
                            'Course Content',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1E293B),
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
                        return moduleTile(
                          title:
                              'Module ${index + 1}: ${course!.modules[index].title}',
                          lessons: List.generate(
                            course!.modules[index].lessons.length,
                            (lessonIndex) =>
                                BlocBuilder<
                                  CourseDetailsCubit,
                                  CourseDetailsState
                                >(
                                  builder: (context, state) => GestureDetector(
                                    onTap: () =>
                                        courseDetailsCubit.openYouTubeVideo(
                                          course!
                                              .modules[index]
                                              .lessons[lessonIndex]
                                              .videoUrl,
                                        ),
                                    child: lessonTile(
                                      toggleComplete: () =>
                                          courseDetailsCubit.toggleComplete(
                                            course!
                                                .modules[index]
                                                .lessons[lessonIndex],
                                          ),
                                      title: course!
                                          .modules[index]
                                          .lessons[lessonIndex]
                                          .title,
                                      subtitle:
                                          '${course!.modules[index].lessons[lessonIndex].minutes} min',
                                      icon: Icons.play_arrow_rounded,
                                      backgroundColor: Color(0xFFE0F2FE),
                                      iconColor: Color(0xFF0C77F2),
                                      isCompleted: course!
                                          .modules[index]
                                          .lessons[lessonIndex]
                                          .isCompleted,
                                    ),
                                  ),
                                ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
      },
    );
  }

  Widget moduleTile({required String title, List<Widget>? lessons}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF2F7FF),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          margin: const EdgeInsets.only(bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1E293B),
                ),
              ),
              const Icon(Icons.expand_more, color: Color(0xFF0C77F2)),
            ],
          ),
        ),
        if (lessons != null) ...lessons,
      ],
    );
  }

  Widget lessonTile({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color backgroundColor,
    required Color iconColor,
    required void Function()? toggleComplete,
    bool isCompleted = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, bottom: 12),
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(icon, color: iconColor, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF1E293B),
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF64748B),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: toggleComplete,
            child: Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                color: isCompleted ? const Color(0xFF22C55E) : Colors.white,
                border: Border.all(
                  color: isCompleted
                      ? const Color(0xFF22C55E)
                      : Colors.grey.shade300,
                ),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.check,
                size: 18,
                color: isCompleted ? Colors.white : Colors.grey.shade400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
