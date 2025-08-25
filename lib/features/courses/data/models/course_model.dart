import '../../domain/entities/course_entity.dart';
import 'module_model.dart';

class CourseModel {
  final String id;
  final String title;
  final String subtitle;
  final String thumbnailUrl;
  final String description;
  final double progress;
  final List<ModuleModel> modules;

  CourseModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.thumbnailUrl,
    required this.description,
    required this.progress,
    required this.modules,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['id'],
      title: json['title'],
      subtitle: json['subtitle'],
      thumbnailUrl: json['thumbnailUrl'],
      description: json['description'],
      progress: json['progress'],
      modules: (json['modules'] as List<dynamic>)
          .map((moduleJson) => ModuleModel.fromJson(moduleJson))
          .toList(),
    );
  }

  CourseEntity toEntity() {
    return CourseEntity(
      id: id,
      title: title,
      subtitle: subtitle,
      thumbnailUrl: thumbnailUrl,
      description: description,
      progress: progress,
      modules: modules.map((e) => e.toEntity()).toList(),
    );
  }
}
