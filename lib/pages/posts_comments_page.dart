import 'package:flutter/material.dart';
import 'package:my_app/models/posts_comments_model.dart';
import 'package:my_app/repositories/posts_comments/posts_comments_dio_repository.dart';
import 'package:my_app/repositories/posts_comments/posts_comments_repository.dart';
import 'package:my_app/shared/widgtes/page_title.dart';

class PostsCommentsPage extends StatefulWidget {
  final int id;
  const PostsCommentsPage({super.key, required this.id});

  @override
  State<PostsCommentsPage> createState() => _PostsCommentsPageState();
}

class _PostsCommentsPageState extends State<PostsCommentsPage> {
  late IPostsCommentsRepo postsCommentsRepo;
  var postCommentsModel = <PostsCommentsModel>[];
  bool loading = false;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    postsCommentsRepo = PostsCommentsDioRepo();
    setState(() {
      loading = true;
    });
    postCommentsModel = await postsCommentsRepo.getComments(widget.id);
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: PageTitle(title: "Comentários do Post ${widget.id}"),
        centerTitle: true,
      ),
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: postCommentsModel.map((e) {
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                elevation: 3,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          e.name,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(e.email),
                      Text(e.body)
                    ],
                  ),
                ),
              );
            }).toList()),
    ));
  }
}
