import 'dart:convert';

import 'package:equatable/equatable.dart';

class TaskModel extends Equatable {
  final String title;
  final String description;
  final String id;
  bool? isDone;
  bool? isDeleted;
  TaskModel({
    required this.title,
    required this.description,
    required this.id,
    this.isDone,
    this.isDeleted,
  }) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
  }

  TaskModel copyWith({
    String? title,
    String? description,
    String? id,
    bool? isDone,
    bool? isDeleted,
  }) {
    return TaskModel(
        title: title ?? this.title,
        description: description ?? this.description,
        id: id ?? this.id,
        isDone: isDone ?? this.isDone,
        isDeleted: isDeleted ?? this.isDeleted);
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'id': id,
      'isDone': isDone,
      'isDeleted': isDeleted,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      id: map['id'] ?? '',
      isDone: map['isDOne'],
      isDeleted: map['isDeleted'],
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [title, description, id, isDone, isDeleted];
}
