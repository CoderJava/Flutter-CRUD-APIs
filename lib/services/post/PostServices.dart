import 'package:flutter_crud_apis/domain/post/PostData.dart';
import 'package:http/http.dart' as http;

String url = "http://api.bengkelrobot.net:8001";

Future<List<PostData>> getAllPosts() async {
  final response = await http.get("$url/posts");
  return postDataFromJson(response.body);
}