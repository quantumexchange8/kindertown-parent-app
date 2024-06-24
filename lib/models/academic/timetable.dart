import 'dart:convert';

List<TimetableData> listTimetableFromJson(String json) {
  Map data = jsonDecode(json);
  return List<TimetableData>.from(
      data.entries.map((e) => TimetableData.fromMapEntry(e)).toList());
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
class TimetableData {
  String day;
  Map<String, String> timetable;
  TimetableData({
    required this.day,
    required this.timetable,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'day': day,
      'timetable': timetable,
    };
  }

  factory TimetableData.fromMapEntry(MapEntry<dynamic, dynamic> map) {
    return TimetableData(
      day: map.key as String,
      timetable: map.value as Map<String, String>,
    );
  }

  String toJson() => json.encode(toMap());
}
