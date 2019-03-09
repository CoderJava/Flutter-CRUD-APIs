import 'dart:io';

import 'package:flutter_crud_apis/domain/post/PostData.dart';
import 'package:http/http.dart' as http;

String url = "http://api.bengkelrobot.net:8001";

Future<List<PostData>> getAllPosts() async {
  final response = await http.get("$url/posts");
  return postDataListFromJson(response.body);
}

Future<http.Response> createPost(PostData postData) async {
  final response = await http.post(
    "$url/posts",
    headers: {HttpHeaders.contentTypeHeader: "application/json"},
    body: postDataToJson(postData),
  );
  return response;
}

Future<http.Response> deletePost(int id) async {
  final response = await http.delete("$url/posts/$id");
  return response;
}

Future<http.Response> updatePost(PostData postData) async {
  final response = await http.put(
    "$url/posts/${postData.id}",
    headers: {HttpHeaders.contentTypeHeader: "application/json"},
    body: postDataToJson(postData),
  );
  return response;
}
