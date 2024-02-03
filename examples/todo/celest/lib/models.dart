// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// By convention, any custom types used within an API request/response must be
// defined in this file or exported from this file.

class Task {
  String id;
  String title;
  String importance;
  bool isCompleted;

  Task({
    required this.id,
    required this.title,
    required this.importance,
     this.isCompleted = false ,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'importance': importance,
      'completed': isCompleted,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'] as String,
      title: map['title'] as String,
      importance: map['importance'] as String,
      isCompleted: map['completed'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source) => Task.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Task(id: $id, title: $title, importance: $importance,  completed: $isCompleted)';

  Task copyWith({
    String? id,
    String? title,
    String? importance,
    bool? isCompleted,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      importance: importance ?? this.importance,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
