import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:tamenny_app/features/community/domain/entites/post_entity.dart';
import 'package:tamenny_app/features/community/domain/repos/community_repo.dart';
import 'community_state.dart';

class CommunityCubit extends Cubit<CommunityState> {
  final CommunityRepo communityRepo;

  CommunityCubit(this.communityRepo) : super(CommunityInitial());

  StreamSubscription? _streamSubscription;

  void getPosts() {
    _streamSubscription?.cancel();
    emit(CommunityLoading());
    _streamSubscription = communityRepo.getPosts().listen((result) {
      result.fold(
        (e) => emit(
          CommunityFailure(e.toString()),
        ),
        (posts) => emit(
          CommunitySuccess(posts),
        ),
      );
    });
  }

  Future<void> likePost(
      {required PostEntity post, required String userId}) async {
    final result = await communityRepo.addLike(post: post, userId: userId);
    result.fold(
      (failure) => emit(CommunityFailure(failure.toString())),
      (_) {
        // بعد إضافة الـ like، قم بتحديث الـ UI بدون الحاجة لجلب كل البوستات من جديد
        toggleLikeInPost(postId: post.postId, userId: userId);
      },
    );
  }

  void toggleLikeInPost({required String postId, required String userId}) {
    if (state is CommunitySuccess) {
      final oldPosts = (state as CommunitySuccess).posts;
      final updatedPosts = oldPosts.map((post) {
        if (post.postId == postId) {
          final isLiked = post.likedBy.contains(userId);
          final updatedLikedBy = isLiked
              ? post.likedBy.where((id) => id != userId).toList()
              : [...post.likedBy, userId];

          final updatedLikesCount =
              isLiked ? post.likesCount - 1 : post.likesCount + 1;

          if (updatedLikesCount == post.likesCount) {
            return post; // إذا لم يتغير شيء في الـ like أو الـ like count، لا حاجة لإرسال الـ state.
          }

          return post.copyWith(
            likedBy: updatedLikedBy,
            likesCount: updatedLikesCount,
          );
        }
        return post;
      }).toList();

      emit(CommunitySuccess(updatedPosts)); // تحديث الـ UI مع البوستات الجديدة
    }
  }

  @override
  Future<void> close() {
    _streamSubscription!.cancel();
    _streamSubscription = null;
    return super.close();
  }
}
