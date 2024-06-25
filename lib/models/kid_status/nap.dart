// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:kindertown_parent_app/models/kid_status/status_comment.dart';
import 'package:kindertown_parent_app/models/teacher.dart';

class NapStatus {
  int id;
  DateTime startTime;
  DateTime endTime;
  Teacher from;
  DateTime createdAt;
  StatusComment? comment;
  NapStatus({
    required this.id,
    required this.startTime,
    required this.endTime,
    required this.from,
    required this.createdAt,
    this.comment,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'start_time': startTime.millisecondsSinceEpoch,
      'end_time': endTime.millisecondsSinceEpoch,
      'from': from.toMap(),
      'created_at': createdAt.millisecondsSinceEpoch,
      'comment': comment?.toMap(),
    };
  }

  factory NapStatus.fromMap(Map<String, dynamic> map) {
    Map from = map['from'];

    return NapStatus(
      id: map['id'] as int,
      startTime: DateTime.parse(map['start_time'] as String),
      endTime: DateTime.parse(map['end_time'] as String),
      from: Teacher(
          id: from['id'],
          name: from['name'],
          profilePicture: from['image'],
          role: 'teacher'),
      createdAt: DateTime.parse(map['created_at'] as String),
      comment:
          map['comment'] != null ? StatusComment.fromMap(map['comment']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory NapStatus.fromJson(String source) =>
      NapStatus.fromMap(json.decode(source));
}