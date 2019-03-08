import 'dart:_http';

import 'package:flutter_crud_apis/Post.dart';
import 'package:http/http.dart' as http;

String url = "https://jsonplaceholder.typicode.com/posts";

Future<Post> getPost() async {
  final response = await http.get("$url/1");
  return postFromJson(response.body);
}

Future<Post> createPost(Post post) async {
  final response = await http.post(
    url,
    headers: {
      HttpHeaders.contentTypeHeader: "application/json"
    },
    body: postToJson(post)
  );
  return postFromJson(response.body);
}
