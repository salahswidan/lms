
import 'package:lms/features/courses/data/models/video_lesson_model.dart';

import '../../domain/entities/module_entity.dart';

class ModuleModel {
  final String id;
  final String title;
  final List<VideoLessonModel> lessons;

  ModuleModel({required this.id, required this.title, required this.lessons});

  factory ModuleModel.fromJson(Map<String, dynamic> json) {
    return ModuleModel(
      id: json['id'],
      title: json['title'],
      lessons: List<VideoLessonModel>.from(
        json['lessons'].map(
          (lessonJson) => VideoLessonModel.fromJson(lessonJson),
        ),
      ),
    );
  }

  ModuleEntity toEntity() {
    return ModuleEntity(
      id: id,
      title: title,
      lessons: lessons.map((e) => e.toEntity()).toList(),
    );
  }
}
