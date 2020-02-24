// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PostController on _PostControllerBase, Store {
  final _$listPostAtom = Atom(name: '_PostControllerBase.listPost');

  @override
  ObservableList<Post> get listPost {
    _$listPostAtom.context.enforceReadPolicy(_$listPostAtom);
    _$listPostAtom.reportObserved();
    return super.listPost;
  }

  @override
  set listPost(ObservableList<Post> value) {
    _$listPostAtom.context.conditionallyRunInAction(() {
      super.listPost = value;
      _$listPostAtom.reportChanged();
    }, _$listPostAtom, name: '${_$listPostAtom.name}_set');
  }

  final _$listCommentAtom = Atom(name: '_PostControllerBase.listComment');

  @override
  ObservableList<Comment> get listComment {
    _$listCommentAtom.context.enforceReadPolicy(_$listCommentAtom);
    _$listCommentAtom.reportObserved();
    return super.listComment;
  }

  @override
  set listComment(ObservableList<Comment> value) {
    _$listCommentAtom.context.conditionallyRunInAction(() {
      super.listComment = value;
      _$listCommentAtom.reportChanged();
    }, _$listCommentAtom, name: '${_$listCommentAtom.name}_set');
  }

  final _$loadPostsAsyncAction = AsyncAction('loadPosts');

  @override
  Future loadPosts() {
    return _$loadPostsAsyncAction.run(() => super.loadPosts());
  }

  final _$loadCommentsAsyncAction = AsyncAction('loadComments');

  @override
  Future loadComments({int idPost}) {
    return _$loadCommentsAsyncAction
        .run(() => super.loadComments(idPost: idPost));
  }

  @override
  String toString() {
    final string =
        'listPost: ${listPost.toString()},listComment: ${listComment.toString()}';
    return '{$string}';
  }
}
