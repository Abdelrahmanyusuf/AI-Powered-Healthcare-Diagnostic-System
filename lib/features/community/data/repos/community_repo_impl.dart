import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:tamenny_app/core/errors/failure.dart';
import 'package:tamenny_app/core/services/database_service.dart';
import 'package:tamenny_app/core/utils/backend_end_point.dart';
import 'package:tamenny_app/features/community/data/models/comment_model.dart';
import 'package:tamenny_app/features/community/data/models/post_model.dart';
import 'package:tamenny_app/features/community/domain/entites/comment_entity.dart';
import 'package:tamenny_app/features/community/domain/entites/post_entity.dart';
import 'package:tamenny_app/features/community/domain/repos/community_repo.dart';

class CommunityRepoImpl implements CommunityRepo {
  final DatabaseService databaseService;

  CommunityRepoImpl(this.databaseService);

  @override
  Stream<Either<Failure, List<PostEntity>>> getPosts() async* {
    try {
      await for (var (result as List<Map<String, dynamic>>) in databaseService
          .streamData(
              path: BackendEndPoint.getPosts,
              query: {'orderBy': 'createdAt', 'descending': true})) {
        List<PostEntity> posts = (result as List<dynamic>).map((data) {
          return PostModel.fromJson(data).toEntity();
        }).toList();
        yield right(posts);
      }
    } catch (e) {
      yield left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addPost({required PostEntity post}) async {
    try {
      await databaseService.addData(
          path: BackendEndPoint.addPost,
          documentId: post.postId,
          data: PostModel.fromEntity(post).toJson());
      return right(null);
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addComment(
      {required CommentEntity comment, required PostEntity post}) async {
    try {
      await databaseService.updateData(
          path: BackendEndPoint.addComment,
          documentId: post.postId,
          data: {
            'comments': FieldValue.arrayUnion(
                [CommentModel.fromEntity(comment).toJson()])
          });
      return right(null);
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addLike(
      {required PostEntity post, required String userId}) async {
    try {
      final postRef =
          FirebaseFirestore.instance.collection('posts').doc(post.postId);

      final alreadyLiked = post.likedBy.contains(userId);

      if (alreadyLiked) {
        await postRef.update({
          'likedBy': FieldValue.arrayRemove([userId]),
          'likesCount': FieldValue.increment(-1),
        });
      } else {
        await postRef.update({
          'likedBy': FieldValue.arrayUnion([userId]),
          'likesCount': FieldValue.increment(1),
        });
      }

      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(errMessage: eitherM.toString()));
    }
  }
}
