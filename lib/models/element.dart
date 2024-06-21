import 'dart:convert';

List<AchievementElement> listAchievementFromJson(String json) {
  List data = jsonDecode(json);
  return List<AchievementElement>.from(
      data.map((e) => AchievementElement.fromMap(e)).toList());
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
class AchievementElement {
  int id;
  String name;
  String imageAddress;
  String silhoutteAddress;
  String description;
  String pronounce;
  bool unlocked;
  AchievementElement({
    required this.id,
    required this.name,
    required this.imageAddress,
    required this.silhoutteAddress,
    required this.description,
    required this.pronounce,
    required this.unlocked,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image_address': imageAddress,
      'silhoutte_address': silhoutteAddress,
      'description': description,
      'pronounce': pronounce,
      'unlocked': unlocked,
    };
  }

  factory AchievementElement.fromMap(Map<String, dynamic> map) {
    String name = map['name'];

    return AchievementElement(
      id: map['id'] as int,
      name: name,
      imageAddress: 'assets/images/missions/$name.png',
      silhoutteAddress: 'assets/images/missions/${name}_shadow.png',
      description: map['description'] as String,
      pronounce: map['pronounce'] as String,
      unlocked: map['unlocked'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory AchievementElement.fromJson(String source) =>
      AchievementElement.fromMap(json.decode(source));
}
