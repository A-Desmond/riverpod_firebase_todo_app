// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Todo {
  final String id;
  final String title;
  final String details;
  Todo({
    required this.id,
    required this.title,
    required this.details,
  });

  Todo copyWith({
    String? id,
    String? title,
    String? details,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      details: details ?? this.details,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'details': details,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'] as String,
      title: map['title'] as String,
      details: map['details'] as String,
    );
  }
}
