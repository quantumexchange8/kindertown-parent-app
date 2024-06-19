import 'dart:convert';

import 'package:intl/intl.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class KidStatus {
  int id;
  String gender;
  DateTime checkInTime;
  DateTime? checkOutTime;
  double temperature;
  KidStatus({
    required this.id,
    required this.gender,
    required this.checkInTime,
    this.checkOutTime,
    required this.temperature,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'gender': gender,
      'check_in_time': DateFormat('yyyy-MM-dd HH:mm:ss').format(checkInTime),
      'check_out_time': checkOutTime != null
          ? DateFormat('yyyy-MM-dd HH:mm:ss').format(checkOutTime!)
          : null,
      'temperature': temperature,
    };
  }

  factory KidStatus.fromMap(Map<String, dynamic> map) {
    final num temperature = map['temperature'];

    return KidStatus(
      id: map['id'] as int,
      gender: map['gender'] as String,
      checkInTime: DateTime.parse(map['check_in_time'] as String),
      checkOutTime: map['check_out_time'] != null
          ? DateTime.parse(map['check_out_time'] as String)
          : null,
      temperature: temperature.toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory KidStatus.fromJson(String source) =>
      KidStatus.fromMap(json.decode(source));
}
