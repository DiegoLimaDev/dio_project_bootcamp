import 'package:my_app/models/posts_comments_model.dart';

abstract class IPostsCommentsRepo {
  Future<List<PostsCommentsModel>> getComments(int id);
}
