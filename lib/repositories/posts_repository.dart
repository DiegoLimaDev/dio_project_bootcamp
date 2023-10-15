import 'dart:convert';

import 'package:my_app/models/posts_model.dart';
import 'package:http/http.dart' as http;

class PostsRepo {
  Future<List<PostsModel>> getAllPosts() async {
    var res =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (res.statusCode == 200) {
      var json = jsonDecode(res.body);
      return (json as List).map((e) => PostsModel.fromJson(e)).toList();
    }
    return [];
  }
}
