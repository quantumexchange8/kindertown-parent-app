import 'dart:convert';

import 'package:kindertown_parent_app/models/photo.dart';
import 'package:kindertown_parent_app/models/review.dart';
import 'package:kindertown_parent_app/models/teacher.dart';

List<Kindergarten> listKindergartenFromJson(String json) {
  List data = jsonDecode(json);
  return List<Kindergarten>.from(
      data.map((e) => Kindergarten.fromMap(e)).toList());
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Kindergarten {
  int id;
  String logo;
  String name;
  String location;
  int totalStudent;
  double rating;
  int totalPeopleRating;
  List<Review> reviewList;
  String backgroundPhoto;
  List<Photo> morePhotos;
  String aboutMe;
  int maxStudent;
  List<Teacher> teacherList;
  int minAge;
  int maxAge;
  Map<String, dynamic> classList;
  String phoneNumber;
  Map<String, dynamic> operationHour;
  List<String> activities;
  List<String> serviceList;
  double feePerMonth;
  String address;
  String email;
  Map<String, dynamic> ratingPerPeopleRate;
  String? videoAddress;
  bool isLiked;
  Kindergarten({
    required this.id,
    required this.logo,
    required this.name,
    required this.location,
    required this.totalStudent,
    required this.rating,
    required this.totalPeopleRating,
    required this.reviewList,
    required this.backgroundPhoto,
    required this.morePhotos,
    required this.aboutMe,
    required this.maxStudent,
    required this.teacherList,
    required this.minAge,
    required this.maxAge,
    required this.classList,
    required this.phoneNumber,
    required this.operationHour,
    required this.activities,
    required this.serviceList,
    required this.feePerMonth,
    required this.address,
    required this.email,
    required this.ratingPerPeopleRate,
    this.videoAddress,
    required this.isLiked,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'logo': logo,
      'name': name,
      'location': location,
      'total_student': totalStudent,
      'rating': rating,
      'total_people_rating': totalPeopleRating,
      'review_list': reviewList.map((e) => e.toMap()).toList(),
      'photo': backgroundPhoto,
      'more_photos': morePhotos.map((e) => e.toMap()).toList(),
      'about_me': aboutMe,
      'max_student': maxStudent,
      'teacher_list': teacherList.map((e) => e.toMap()).toList(),
      'min_age': minAge,
      'max_age': maxAge,
      'class_list': classList,
      'phone_number': phoneNumber,
      'operation_hour': operationHour,
      'activities': activities,
      'service_list': serviceList,
      'fee_per_month': feePerMonth,
      'address': address,
      'email': email,
      'rating_per_people_rate': ratingPerPeopleRate,
      'video_address': videoAddress,
      'is_liked': isLiked,
    };
  }

  factory Kindergarten.fromMap(Map<String, dynamic> map) {
    final List reviewList = map['review_list'];
    final List teacherList = map['teacher_list'];
    final List morePhotos = map['more_photos'];

    return Kindergarten(
      id: map['id'] as int,
      logo: map['photo'] as String,
      name: map['name'] as String,
      location: map['location'] as String,
      totalStudent: map['total_student'] as int,
      rating: map['rating'] as double,
      totalPeopleRating: map['total_people_rating'] as int,
      reviewList: reviewList.map((e) => Review.fromMap(e)).toList(),
      backgroundPhoto: map['photo'] as String,
      morePhotos: morePhotos.map((e) => Photo.fromMap(e)).toList(),
      aboutMe: map['about_me'] as String,
      maxStudent: map['max_student'] as int,
      teacherList: teacherList.map((e) => Teacher.fromMap(e)).toList(),
      minAge: map['min_age'] as int,
      maxAge: map['max_age'] as int,
      classList: map['class_list'],
      phoneNumber: map['phone_number'] as String,
      operationHour: map['operation_hour'],
      activities: map['activities'],
      serviceList: map['service_list'],
      feePerMonth: map['fee_per_month'],
      address: map['address'] as String,
      email: map['email'] as String,
      ratingPerPeopleRate: map['rating_per_people_rate'],
      videoAddress:
          map['video_address'] != null ? map['video_address'] as String : null,
      isLiked: map['is_liked'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Kindergarten.fromJson(String source) =>
      Kindergarten.fromMap(json.decode(source));
}