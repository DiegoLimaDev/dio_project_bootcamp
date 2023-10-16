import 'package:my_app/models/posts_model.dart';

abstract class IPostsRepo {
  Future<List<PostsModel>> getAllPosts();
}
