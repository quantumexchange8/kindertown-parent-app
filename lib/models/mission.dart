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
  int completedMission;
  int totalMission;
  Mission({
    required this.id,
    required this.description,
    required this.iconAddress,
    required this.completedMission,
    required this.totalMission,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'description': description,
      'icon_address': iconAddress,
      'completed_mission': completedMission,
      'total_mission': totalMission,
    };
  }

  factory Mission.fromMap(Map<String, dynamic> map) {
    String description = map['description'];
    String iconAddress;
    if (description.toLowerCase().contains('water')) {
      iconAddress = 'assets/icons/water_icon.png';
    } else {
      iconAddress = 'assets/icons/homework_icon.png';
    }

    return Mission(
      id: map['id'] as int,
      description: description,
      iconAddress: iconAddress,
      completedMission: map['completed_mission'] as int,
      totalMission: map['total_mission'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Mission.fromJson(String source) =>
      Mission.fromMap(json.decode(source) as Map<String, dynamic>);
}
