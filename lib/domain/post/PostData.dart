import 'dart:convert';

class PostData {
  int id;
  String title;
  String author;

  PostData({this.id, this.title, this.author});

  factory PostData.fromJson(Map<String, dynamic> json) {
    return PostData(
      id: json["id"],
      title: json["title"],
      author: json["author"]
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "author": author
    };
  }
}

List<PostData> postDataListFromJson(String str) {
  final jsonData = json.decode(str);
  return List<PostData>.from(jsonData.map((value) {
    return PostData.fromJson(value);
  }));
}

String postDataListToJson(List<PostData> data) {
  final dyn = List<dynamic>.from(data.map((value) {
    return value.toJson();
  }));
  return json.encode(dyn);
}

PostData postDataFromJson(String str) {
  final jsonData = json.decode(str);
  return PostData.fromJson(jsonData);
}

String postDataToJson(PostData data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}