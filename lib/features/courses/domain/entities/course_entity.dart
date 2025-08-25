import 'module_entity.dart';

class CourseEntity {
  final String id;
  final String title;
  final String subtitle;
  final String thumbnailUrl;
  final String description;
  final double progress;
  final List<ModuleEntity> modules;
  bool isFavorited;

  CourseEntity({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.thumbnailUrl,
    required this.description,
    required this.progress,
    required this.modules,
    this.isFavorited = false,
  });

  static CourseEntity empty() {
    return CourseEntity(
      id: '',
      title: '',
      subtitle: '',
      thumbnailUrl: '',
      description: '',
      isFavorited: false,
      progress: 0,
      modules: [],
    );
  }

  void toggleFavorite() {
    isFavorited = !isFavorited;
  }
}
