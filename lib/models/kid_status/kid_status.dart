import 'dart:convert';

import 'package:kindertown_parent_app/models/kid_status/check_in.dart';
import 'package:kindertown_parent_app/models/kid_status/check_out.dart';
import 'package:kindertown_parent_app/models/kid_status/meal_intake.dart';
import 'package:kindertown_parent_app/models/kid_status/nap.dart';
import 'package:kindertown_parent_app/models/kid_status/photo_status.dart';
import 'package:kindertown_parent_app/models/kid_status/potty.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class KidStatus {
  int id;
  String name;
  String gender;
  String kindergartenName;
  List<CheckInStatus> checkIn;
  List<PottyStatus> potty;
  List<MealIntakeStatus> mealIntake;
  List<NapStatus> nap;
  List<PhotoStatus> photo;
  List<CheckoutStatus> checkOut;
  KidStatus({
    required this.id,
    required this.name,
    required this.gender,
    required this.kindergartenName,
    required this.checkIn,
    required this.potty,
    required this.mealIntake,
    required this.nap,
    required this.photo,
    required this.checkOut,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'gender': gender,
      'kindergarten_name': kindergartenName,
      'check_in': checkIn.map((x) => x.toMap()).toList(),
      'potty': potty.map((x) => x.toMap()).toList(),
      'meal_intake': mealIntake.map((x) => x.toMap()).toList(),
      'nap': nap.map((x) => x.toMap()).toList(),
      'photo': photo.map((x) => x.toMap()).toList(),
      'check_out': checkOut.map((x) => x.toMap()).toList(),
    };
  }

  factory KidStatus.fromMap(Map<String, dynamic> map) {
    List checkIn = map['check_in'];
    List potty = map['potty'];
    List mealIntake = map['meal_intake'];
    List nap = map['nap'];
    List photo = map['photo'];
    List checkOut = map['check_out'];

    return KidStatus(
      id: map['id'] as int,
      name: map['name'] as String,
      gender: map['gender'] as String,
      kindergartenName: map['kindergarten_name'] as String,
      checkIn: checkIn.map((ci) => CheckInStatus.fromMap(ci)).toList(),
      potty: potty.map((p) => PottyStatus.fromMap(p)).toList(),
      mealIntake: mealIntake.map((m) => MealIntakeStatus.fromMap(m)).toList(),
      nap: nap.map((n) => NapStatus.fromMap(n)).toList(),
      photo: photo.map((ph) => PhotoStatus.fromMap(ph)).toList(),
      checkOut: checkOut.map((co) => CheckoutStatus.fromMap(co)).toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory KidStatus.fromJson(String source) =>
      KidStatus.fromMap(json.decode(source));
}
