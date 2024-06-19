import 'dart:convert';

List<Mail> listMailFromJson(String json) {
  List data = jsonDecode(json);
  return List<Mail>.from(data.map((e) => Mail.fromMap(e)).toList());
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Mail {
  int id;
  DateTime createdAt;
  String from;
  String title;
  String body;
  bool read;
  Mail({
    required this.id,
    required this.createdAt,
    required this.from,
    required this.title,
    required this.body,
    required this.read,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'created_at': createdAt.millisecondsSinceEpoch,
      'from': from,
      'title': title,
      'body': body,
      'read': read,
    };
  }

  factory Mail.fromMap(Map<String, dynamic> map) {
    return Mail(
      id: map['id'] as int,
      createdAt: DateTime.parse(map['created_at'] as String),
      from: map['from'] as String,
      title: map['title'] as String,
      body: map['body'] as String,
      read: map['read'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Mail.fromJson(String source) => Mail.fromMap(json.decode(source));
}
