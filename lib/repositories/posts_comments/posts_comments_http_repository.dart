import 'dart:convert';

import 'package:my_app/models/posts_comments_model.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/repositories/posts_comments/posts_comments_repository.dart';

class PostsCommentsHttpRepo implements IPostsCommentsRepo {
  @override
  Future<List<PostsCommentsModel>> getComments(int id) async {
    final res = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts/$id/comments'));
    if (res.statusCode == 200) {
      var json = jsonDecode(res.body);
      return (json as List).map((e) => PostsCommentsModel.fromJson(e)).toList();
    }
    return [];
  }
}
