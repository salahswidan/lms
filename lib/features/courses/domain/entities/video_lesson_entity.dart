class VideoLessonEntity {
  final String id;
  final String title;
  final String videoUrl;
  final int minutes;
  bool isCompleted;

  VideoLessonEntity({
    required this.id,
    required this.title,
    required this.videoUrl,
    required this.minutes,
    required this.isCompleted,
  });

  bool toggleComplete() {
    return isCompleted = !isCompleted;
  }
}
