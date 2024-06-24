import 'dart:convert';

List<SkillAssessment> listSkillAssessmentFromJson(String json) {
  List data = jsonDecode(json);
  return List<SkillAssessment>.from(
      data.map((e) => SkillAssessment.fromMap(e)).toList());
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
class SkillAssessment {
  int id;
  String skill;
  double percentage;
  List<SkillAssessmentSubs> subs;
  SkillAssessment({
    required this.id,
    required this.skill,
    required this.percentage,
    required this.subs,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'skill': skill,
      'percentage': percentage,
      'subs': subs.map((x) => x.toMap()).toList(),
    };
  }

  factory SkillAssessment.fromMap(Map<String, dynamic> map) {
    List subs = map['subs'];
    num percentage = map['percentage'];

    return SkillAssessment(
      id: map['id'] as int,
      skill: map['skill'] as String,
      percentage: percentage.toDouble(),
      subs: subs.map((e) => SkillAssessmentSubs.fromMap(e)).toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory SkillAssessment.fromJson(String source) =>
      SkillAssessment.fromMap(json.decode(source) as Map<String, dynamic>);
}

class SkillAssessmentSubs {
  int id;
  String subtitle;
  double percentage;
  Map<String, String> subs;
  SkillAssessmentSubs({
    required this.id,
    required this.subtitle,
    required this.percentage,
    required this.subs,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'subtitle': subtitle,
      'percentage': percentage,
      'subs': subs,
    };
  }

  factory SkillAssessmentSubs.fromMap(Map<String, dynamic> map) {
    num percentage = map['percentage'];

    return SkillAssessmentSubs(
      id: map['id'] as int,
      subtitle: map['subtitle'] as String,
      percentage: percentage.toDouble(),
      subs: Map<String, String>.from((map['subs'])),
    );
  }

  String toJson() => json.encode(toMap());

  factory SkillAssessmentSubs.fromJson(String source) =>
      SkillAssessmentSubs.fromMap(json.decode(source));
}
