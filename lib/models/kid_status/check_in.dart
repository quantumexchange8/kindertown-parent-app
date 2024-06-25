// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:kindertown_parent_app/models/kid_status/status_comment.dart';
import 'package:kindertown_parent_app/models/teacher.dart';

class CheckInStatus {
  int id;
  DateTime time;
  double temperature;
  Teacher from;
  DateTime createdAt;
  StatusComment? statusComment;
  CheckInStatus({
    required this.id,
    required this.time,
    required this.temperature,
    required this.from,
    required this.createdAt,
    this.statusComment,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'time': time.millisecondsSinceEpoch,
      'temperature': temperature,
      'from': from.toMap(),
      'created_at': createdAt.millisecondsSinceEpoch,
      'comment': statusComment?.toMap(),
    };
  }

  factory CheckInStatus.fromMap(Map<String, dynamic> map) {
    Map from = map['from'];

    return CheckInStatus(
      id: map['id'] as int,
      time: DateTime.parse(map['time'] as String),
      temperature: map['temperature'] as double,
      from: Teacher(
          id: from['id'],
          name: from['name'],
          profilePicture: from['image'],
          role: 'teacher'),
      createdAt: DateTime.parse(map['created_at'] as String),
      statusComment:
          map['comment'] != null ? StatusComment.fromMap(map['comment']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CheckInStatus.fromJson(String source) =>
      CheckInStatus.fromMap(json.decode(source));
}
