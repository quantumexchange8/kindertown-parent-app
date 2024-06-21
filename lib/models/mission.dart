import 'dart:convert';

List<Mission> listMissionFromJson(String json) {
  List data = jsonDecode(json);
  return List<Mission>.from(data.map((e) => Mission.fromMap(e)).toList());
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Mission {
  int id;
  String description;
  String iconAddress;
  bool isCompleted;
  Mission({
    required this.id,
    required this.description,
    required this.iconAddress,
    required this.isCompleted,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'description': description,
      'icon_address': iconAddress,
      'is_completed': isCompleted
    };
  }

  factory Mission.fromMap(Map<String, dynamic> map) {
    String description = map['description'];
    String iconAddress;
    if (description.toLowerCase().contains('water')) {
      iconAddress = 'assets/icons/missions/water_icon.png';
    } else if (description.toLowerCase().contains('sleep')) {
      iconAddress = 'assets/icons/missions/sleep_icon.png';
    } else {
      iconAddress = 'assets/icons/missions/homework_icon.png';
    }

    return Mission(
        id: map['id'] as int,
        description: description,
        iconAddress: iconAddress,
        isCompleted: map['completed'] as bool);
  }

  String toJson() => json.encode(toMap());

  factory Mission.fromJson(String source) =>
      Mission.fromMap(json.decode(source));
}
