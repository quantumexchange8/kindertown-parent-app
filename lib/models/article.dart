import 'dart:convert';

List<Article> listArticleFromJson(String json) {
  List data = jsonDecode(json);
  return List<Article>.from(data.map((e) => Article.fromMap(e)).toList());
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Article {
  int id;
  String image;
  String title;
  Article({
    required this.id,
    required this.image,
    required this.title,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'image': image,
      'title': title,
    };
  }

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      id: map['id'] as int,
      image: map['image'] as String,
      title: map['title'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Article.fromJson(String source) =>
      Article.fromMap(json.decode(source));
}
