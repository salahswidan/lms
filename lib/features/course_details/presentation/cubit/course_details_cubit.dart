import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/features/courses/domain/entities/video_lesson_entity.dart';
import 'package:url_launcher/url_launcher.dart';

part 'course_details_state.dart';

class CourseDetailsCubit extends Cubit<CourseDetailsState> {
  CourseDetailsCubit() : super(CourseDetailsState(isComplete: false));

  void toggleComplete(VideoLessonEntity lesson) {
    emit(state.copyWith(isComplete: lesson.toggleComplete()));
  }

  void openYouTubeVideo(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
}
