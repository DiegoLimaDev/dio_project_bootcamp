import 'package:flutter/material.dart';
import 'package:my_app/models/posts_model.dart';
import 'package:my_app/pages/posts_comments_page.dart';
import 'package:my_app/repositories/posts/posts_dio_repository.dart';
import 'package:my_app/repositories/posts/posts_http_repository.dart';
import 'package:my_app/repositories/posts/posts_repository.interface.dart';
import 'package:my_app/shared/widgtes/page_title.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  var posts = <PostsModel>[];
  late IPostsRepo postsRepo;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    postsRepo = PostsDioRepo();
    setState(() {
      loading = true;
    });
    posts = await postsRepo.getAllPosts();
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const PageTitle(title: 'Posts'),
          centerTitle: true,
        ),
        body: loading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: posts.length,
                itemBuilder: (_, index) {
                  var post = posts[index];
                  return Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Card(
                      elevation: 3,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              post.title,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w800),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              post.body,
                              style: const TextStyle(fontSize: 14),
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: double.infinity,
                              alignment: Alignment.bottomRight,
                              child: TextButton(
                                  style: const ButtonStyle(
                                      alignment: Alignment.center,
                                      backgroundColor: MaterialStatePropertyAll(
                                          Colors.green)),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => PostsCommentsPage(
                                                id: post.id)));
                                  },
                                  child: const Text(
                                    "Comentários",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14),
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
