import 'package:dartz/dartz.dart';
import 'package:tamenny_app/core/errors/failure.dart';
import 'package:tamenny_app/features/community/domain/entites/comment_entity.dart';
import 'package:tamenny_app/features/community/domain/entites/post_entity.dart';

abstract class CommunityRepo {
  Stream<Either<Failure, List<PostEntity>>> getPosts();
  Future<Either<Failure, void>> addPost({required PostEntity post});
  Future<Either<Failure, void>> addComment(
      {required CommentEntity comment, required PostEntity post});
  Future<Either<Failure, void>> addLike({
    required PostEntity post,
    required String userId,
  });
}
