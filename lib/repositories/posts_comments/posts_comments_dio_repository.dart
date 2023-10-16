import 'package:my_app/models/posts_comments_model.dart';
import 'package:my_app/repositories/posts_comments/posts_comments_repository.dart';
import 'package:my_app/utils/jsonplaceholder_custom_dio.dart';

class PostsCommentsDioRepo implements IPostsCommentsRepo {
  @override
  Future<List<PostsCommentsModel>> getComments(int id) async {
    JsonPlaceholderCustomDio jsonPlaceholderCustomDio =
        JsonPlaceholderCustomDio();
    var res = await jsonPlaceholderCustomDio.dio.get('/posts/$id/comments');

    if (res.statusCode == 200) {
      return (res.data as List)
          .map((e) => PostsCommentsModel.fromJson(e))
          .toList();
    }
    return [];
  }
}
