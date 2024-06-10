import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Review {
  int id;
  String username;
  String profilePicture;
  double rating;
  String title;
  String body;
  Review({
    required this.id,
    required this.username,
    required this.profilePicture,
    required this.rating,
    required this.title,
    required this.body,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': username,
      'profile_picture': profilePicture,
      'rating': rating,
      'title': title,
      'body': body,
    };
  }

  factory Review.fromMap(Map<String, dynamic> map) {
    return Review(
      id: map['id'] as int,
      username: map['name'] as String,
      profilePicture: map['profile_picture'] as String,
      rating: map['rating'] as double,
      title: map['title'] as String,
      body: map['body'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Review.fromJson(String source) => Review.fromMap(json.decode(source));
}
