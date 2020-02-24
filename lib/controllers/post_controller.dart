import 'package:mobx/mobx.dart';
import 'package:mvc_example/models/comment_model.dart';
import 'package:mvc_example/models/post_model.dart';
import 'package:mvc_example/repositories/post_repository.dart';
part 'post_controller.g.dart';

class PostController = _PostControllerBase with _$PostController;

abstract class _PostControllerBase with Store {
  PostRepository _postRepository;

  _PostControllerBase() {
    _postRepository = PostRepository();
  }

  @observable
  ObservableList<Post> listPost;

  @observable
  ObservableList<Comment> listComment;

  @action
  loadPosts() async {
    listPost = ObservableList<Post>.of(await _postRepository.getAllPosts());
  }

  @action
  loadComments({int idPost}) async {
    listComment = ObservableList<Comment>.of(await _postRepository.getComments(idPost));
  }

}