import 'package:my_app/models/posts_model.dart';
import 'package:my_app/repositories/posts/posts_repository.interface.dart';
import 'package:my_app/utils/jsonplaceholder_custom_dio.dart';

class PostsDioRepo implements IPostsRepo {
  @override
  Future<List<PostsModel>> getAllPosts() async {
    var jsonPlaceholderCustomDio = JsonPlaceholderCustomDio();
    var res = await jsonPlaceholderCustomDio.dio.get('/posts');
    if (res.statusCode == 200) {
      return (res.data as List).map((e) => PostsModel.fromJson(e)).toList();
    }
    return [];
  }
}
