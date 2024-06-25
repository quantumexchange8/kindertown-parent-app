import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class StatusComment {
  int id;
  String? comment;
  String? image;
  StatusComment({
    required this.id,
    this.comment,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'comment': comment,
      'image': image,
    };
  }

  factory StatusComment.fromMap(Map<String, dynamic> map) {
    return StatusComment(
      id: map['id'] as int,
      comment: map['comment'] != null ? map['comment'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory StatusComment.fromJson(String source) =>
      StatusComment.fromMap(json.decode(source));
}
