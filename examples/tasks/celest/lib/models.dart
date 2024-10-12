// By convention, any custom types used within an API request/response must be
// defined in this file or exported from this file.

enum Importance { low, medium, high }

class Task {
  const Task({
    required this.id,
    required this.title,
    required this.importance,
    this.isCompleted = false,
  });

  final String id;
  final String title;
  final Importance importance;
  final bool isCompleted;

  Task copyWith({
    String? id,
    String? title,
    Importance? importance,
    bool? isCompleted,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      importance: importance ?? this.importance,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  String toString() =>
      'Task(id: $id, title: $title, importance: $importance,  completed: $isCompleted)';
}
