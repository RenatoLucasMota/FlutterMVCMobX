import 'dart:convert';

import 'package:mvc_example/interfaces/post_repository_interface.dart';
import 'package:mvc_example/models/comment_model.dart';
import 'package:mvc_example/models/post_model.dart';
import 'package:mvc_example/shared/consts_api.dart';
import 'package:http/http.dart' as http;

class PostRepository implements IPostRepository {

  @override
  Future<List<Post>> getAllPosts() async {
    try {
      List<Post> listPost = List();
      final response = await http.get(ConstsApi.POST_URL);
      if (response.statusCode == 200) {
        var decodeJson = jsonDecode(response.body);
        decodeJson.forEach((item) => listPost.add(Post.fromJson(item)));
        return listPost;
      } else {
        print("Erro ao carregar lista" + response.statusCode.toString());
        return null;
      }
    } catch (error, stacktrace) {
      print("Erro ao carregar lista" + stacktrace.toString());
      return null;
    }
  }

  @override
  Future<List<Comment>> getComments(int idPost) async {
    try {
      List<Comment> listComment = List();
      final response =
          await http.get(ConstsApi.COMMENT_URL + idPost.toString());
      if (response.statusCode == 200) {
        var decodeJson = jsonDecode(response.body);
        decodeJson.forEach((item) => listComment.add(Comment.fromJson(item)));
        return listComment;
      } else {
        print("Erro ao carregar lista" + response.statusCode.toString());
        return null;
      }
    } catch (error, stacktrace) {
      print("Erro ao carregar lista" + stacktrace.toString());
      return null;
    }
  }
}
