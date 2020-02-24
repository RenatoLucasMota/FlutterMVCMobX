import 'package:mvc_example/models/comment_model.dart';
import 'package:mvc_example/models/post_model.dart';

abstract class IPostRepository {
  Future<List<Post>> getAllPosts();
  Future<List<Comment>> getComments(int idPost);
}