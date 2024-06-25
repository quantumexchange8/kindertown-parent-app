// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:kindertown_parent_app/models/kid_status/status_comment.dart';
import 'package:kindertown_parent_app/models/teacher.dart';

class CheckoutStatus {
  int id;
  DateTime time;
  Teacher from;
  DateTime createdAt;
  StatusComment? comment;
  CheckoutStatus({
    required this.id,
    required this.time,
    required this.from,
    required this.createdAt,
    this.comment,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'time': time.millisecondsSinceEpoch,
      'from': from.toMap(),
      'created_at': createdAt.millisecondsSinceEpoch,
      'comment': comment?.toMap(),
    };
  }

  factory CheckoutStatus.fromMap(Map<String, dynamic> map) {
    Map from = map['from'];

    return CheckoutStatus(
      id: map['id'] as int,
      time: DateTime.parse(map['time'] as String),
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

  factory CheckoutStatus.fromJson(String source) =>
      CheckoutStatus.fromMap(json.decode(source));
}
