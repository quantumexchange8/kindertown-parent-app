import 'dart:convert';

List<Programme> listProgrammeFromJson(String json) {
  List data = jsonDecode(json);
  return List<Programme>.from(data.map((e) => Programme.fromMap(e)).toList());
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Programme {
  int id;
  String name;
  String description;
  String teacherStudentRatio;
  String studentAgeRange;
  String studentCategory;
  String time;
  String billingStartOn;
  Map<String, num> availableBillingMode;
  List<String> classActivities;
  Programme({
    required this.id,
    required this.name,
    required this.description,
    required this.teacherStudentRatio,
    required this.studentAgeRange,
    required this.studentCategory,
    required this.time,
    required this.billingStartOn,
    required this.availableBillingMode,
    required this.classActivities,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'teacher_student_ratio': teacherStudentRatio,
      'student_age_range': studentAgeRange,
      'student_category': studentCategory,
      'time': time,
      'billing_start_on': billingStartOn,
      'available_billing_mode': availableBillingMode,
      'class_activities': classActivities,
    };
  }

  factory Programme.fromMap(Map<String, dynamic> map) {
    return Programme(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      teacherStudentRatio: map['teacher_student_ratio'] as String,
      studentAgeRange: map['student_age_range'] as String,
      studentCategory: map['student_category'] as String,
      time: map['time'] as String,
      billingStartOn: map['billing_start_on'] as String,
      availableBillingMode: map['available_billing_mode'],
      classActivities: map['class_activities'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Programme.fromJson(String source) =>
      Programme.fromMap(json.decode(source));
}
