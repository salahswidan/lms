import '../../domain/entities/video_lesson_entity.dart';

class VideoLessonModel {
  final String id;
  final String title;
  final String videoUrl;
  final int minutes;
  final bool isCompleted;

  VideoLessonModel({
    required this.id,
    required this.title,
    required this.videoUrl,
    required this.minutes,
    required this.isCompleted,
  });

  factory VideoLessonModel.fromJson(Map<String, dynamic> json) {
    return VideoLessonModel(
      id: json['id'],
      title: json['title'],
      videoUrl: json['videoUrl'],
      minutes: json['duration'],
      isCompleted: json['isCompleted'],
    );
  }

  VideoLessonEntity toEntity() {
    return VideoLessonEntity(
      id: id,
      title: title,
      videoUrl: videoUrl,
      minutes: minutes,
      isCompleted: isCompleted,
    );
  }
}
