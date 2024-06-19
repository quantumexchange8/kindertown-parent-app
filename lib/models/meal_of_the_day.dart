import 'dart:convert';

List<MealOfTheDay> listMealOfTheDayFromJson(String json) {
  List data = jsonDecode(json);
  return List<MealOfTheDay>.from(
      data.map((e) => MealOfTheDay.fromMap(e)).toList());
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
class MealOfTheDay {
  int id;
  String type;
  String description;
  String image;
  MealOfTheDay({
    required this.id,
    required this.type,
    required this.description,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'type': type,
      'description': description,
      'image': image,
    };
  }

  factory MealOfTheDay.fromMap(Map<String, dynamic> map) {
    return MealOfTheDay(
      id: map['id'] as int,
      type: map['type'] as String,
      description: map['description'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MealOfTheDay.fromJson(String source) =>
      MealOfTheDay.fromMap(json.decode(source));
}
