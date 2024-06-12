import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Photo {
  int id;
  String type;
  String address;
  String? description;
  Photo({
    required this.id,
    required this.type,
    required this.address,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'type': type,
      'address': address,
      'description': description,
    };
  }

  factory Photo.fromMap(Map<String, dynamic> map) {
    return Photo(
      id: map['id'] as int,
      type: map['type'] as String,
      address: map['address'] as String,
      description:
          map['description'] == null ? null : map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Photo.fromJson(String source) => Photo.fromMap(json.decode(source));
}
