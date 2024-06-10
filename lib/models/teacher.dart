import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Teacher {
  int id;
  String name;
  String profilePicture;
  String role;
  Teacher({
    required this.id,
    required this.name,
    required this.profilePicture,
    required this.role,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': profilePicture,
      'role': role,
    };
  }

  factory Teacher.fromMap(Map<String, dynamic> map) {
    return Teacher(
      id: map['id'] as int,
      name: map['name'] as String,
      profilePicture: map['image'] as String,
      role: map['role'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Teacher.fromJson(String source) =>
      Teacher.fromMap(json.decode(source));
}
