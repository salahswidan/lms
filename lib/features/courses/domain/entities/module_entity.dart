import 'package:lms/features/courses/domain/entities/video_lesson_entity.dart';

class ModuleEntity {
  final String id;
  final String title;
  final List<VideoLessonEntity> lessons;

  ModuleEntity({required this.id, required this.title, required this.lessons});
}
