import 'dart:convert';

List<Event> listEventFromJson(String json) {
  List data = jsonDecode(json);
  return List<Event>.from(data.map((e) => Event.fromMap(e)).toList());
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Event {
  int id;
  String name;
  String description;
  List<String> pictureList;
  Event({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureList,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'picture_list': pictureList,
    };
  }

  factory Event.fromMap(Map<String, dynamic> map) {
    return Event(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      pictureList: map['picture_list'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Event.fromJson(String source) => Event.fromMap(json.decode(source));
}
