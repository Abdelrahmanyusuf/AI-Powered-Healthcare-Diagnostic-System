import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tamenny_app/core/cubits/user_cubit/user_cubit.dart';
import 'package:tamenny_app/core/services/database_service.dart';
import 'package:tamenny_app/core/services/get_it_service.dart';
import 'package:tamenny_app/core/utils/backend_end_point.dart';
import 'package:tamenny_app/features/community/domain/entites/comment_entity.dart';
import 'package:tamenny_app/features/community/domain/entites/post_entity.dart';
import 'package:tamenny_app/features/community/domain/repos/community_repo.dart';

part 'add_comment_state.dart';

class AddCommentCubit extends Cubit<AddCommentState> {
  AddCommentCubit(this.communityRepo, this.databaseService)
      : super(AddCommentInitial());

  final CommunityRepo communityRepo;
  final DatabaseService databaseService;
  late String commentText;

  addComment({required PostEntity post}) async {
    CommentEntity commentEntity = CommentEntity(
        username: getIt<UserCubit>().currentUser!.name,
        comment: commentText,
        avatarUrl: getIt<UserCubit>().currentUser!.userAvatarUrl);
    emit(AddCommentLoading());
    var result =
        await communityRepo.addComment(comment: commentEntity, post: post);
    result.fold((f) => emit(AddCommentFailure(errMessage: f.errMessage)), (r) {
      emit(AddCommentSuccess());
      databaseService.updateData(
          path: BackendEndPoint.updateCommentsCount,
          documentId: post.postId,
          data: {'commentsCount': (post.commentsCount + 1)});
    });
  }
}
