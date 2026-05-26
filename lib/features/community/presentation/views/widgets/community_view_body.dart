import 'package:flutter/material.dart';
import 'package:tamenny_app/features/community/domain/entites/post_entity.dart';
import 'package:tamenny_app/features/community/presentation/views/widgets/post.dart';

class CommunityViewBody extends StatefulWidget {
  const CommunityViewBody({
    super.key,
    required this.posts,
  });

  final List<PostEntity> posts;

  @override
  State<CommunityViewBody> createState() => _CommunityViewBodyState();
}

class _CommunityViewBodyState extends State<CommunityViewBody> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: ListView.separated(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) => const SizedBox(
          height: 20,
        ),
        itemCount: widget.posts.length,
        itemBuilder: (context, index) => Post(post: widget.posts[index]),
      ),
    );
  }
}
