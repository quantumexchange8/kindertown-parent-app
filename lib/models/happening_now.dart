import 'dart:convert';

List<HappeningNow> listHappeningNowFromJson(String json) {
  List data = jsonDecode(json);
  return List<HappeningNow>.from(
      data.map((e) => HappeningNow.fromMap(e)).toList());
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
class HappeningNow {
  int id;
  DateTime startDate;
  String title;
  String description;
  HappeningNow({
    required this.id,
    required this.startDate,
    required this.title,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'start_date': startDate.millisecondsSinceEpoch,
      'title': title,
      'description': description,
    };
  }

  factory HappeningNow.fromMap(Map<String, dynamic> map) {
    return HappeningNow(
      id: map['id'] as int,
      startDate: DateTime.parse(map['start_date'] as String),
      title: map['title'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory HappeningNow.fromJson(String source) =>
      HappeningNow.fromMap(json.decode(source));
}
