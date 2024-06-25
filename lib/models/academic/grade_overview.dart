import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class GradeOverview {
  int id;
  int rank;
  int totalRank;
  List<Grade> gradeList;
  GradeOverview({
    required this.id,
    required this.rank,
    required this.totalRank,
    required this.gradeList,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'rank': rank,
      'total_rank': totalRank,
      'grade_list': gradeList.map((x) => x.toMap()).toList(),
    };
  }

  factory GradeOverview.fromMap(Map<String, dynamic> map) {
    List gradeList = map['grade_list'];

    return GradeOverview(
      id: map['id'] as int,
      rank: map['rank'] as int,
      totalRank: map['total_rank'] as int,
      gradeList: gradeList.map((e) => Grade.fromMap(e)).toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory GradeOverview.fromJson(String source) =>
      GradeOverview.fromMap(json.decode(source));
}

class Grade {
  int id;
  String subject;
  double mark;
  String grade;
  GradeComment? gradeComment;
  Grade(
      {required this.id,
      required this.subject,
      required this.mark,
      required this.grade,
      this.gradeComment});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'subject': subject,
      'mark': mark,
      'grade': grade,
      'grade_comment': gradeComment
    };
  }

  factory Grade.fromMap(Map<String, dynamic> map) {
    num mark = map['mark'];

    return Grade(
      id: map['id'] as int,
      subject: map['subject'] as String,
      mark: mark.toDouble(),
      grade: map['grade'] as String,
      gradeComment: map['grade_comment'] == null
          ? null
          : GradeComment.fromMap(map['grade_comment']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Grade.fromJson(String source) => Grade.fromMap(json.decode(source));
}

class GradeComment {
  int id;
  String from;
  String comment;
  GradeComment({
    required this.id,
    required this.from,
    required this.comment,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'from': from,
      'comment': comment,
    };
  }

  factory GradeComment.fromMap(Map<String, dynamic> map) {
    return GradeComment(
      id: map['id'] as int,
      from: map['from'] as String,
      comment: map['comment'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GradeComment.fromJson(String source) =>
      GradeComment.fromMap(json.decode(source));
}
