import 'package:tamenny_app/features/home/domain/entites/article_entity.dart';

class ArticleModel {
  String? articleId;
  String? title;
  String? link;
  dynamic keywords;
  dynamic creator;
  String? description;
  String? content;
  String? pubDate;
  String? pubDateTz;
  String? imageUrl;
  dynamic videoUrl;
  String? sourceId;
  String? sourceName;
  int? sourcePriority;
  String? sourceUrl;
  String? sourceIcon;
  String? language;
  List<String>? country;
  List<String>? category;
  String? sentiment;
  String? sentimentStats;
  String? aiTag;
  String? aiRegion;
  String? aiOrg;
  bool? duplicate;

  ArticleModel({
    this.articleId,
    this.title,
    this.link,
    this.keywords,
    this.creator,
    this.description,
    this.content,
    this.pubDate,
    this.pubDateTz,
    this.imageUrl,
    this.videoUrl,
    this.sourceId,
    this.sourceName,
    this.sourcePriority,
    this.sourceUrl,
    this.sourceIcon,
    this.language,
    this.country,
    this.category,
    this.sentiment,
    this.sentimentStats,
    this.aiTag,
    this.aiRegion,
    this.aiOrg,
    this.duplicate,
  });

  ArticleEntity toEntity() => ArticleEntity(
      description: description ?? '',
      imageUrl: imageUrl ?? '',
      title: title ?? '',
      url: link ?? '');

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
        articleId: json['article_id'] as String?,
        title: json['title'] as String?,
        link: json['link'] as String?,
        keywords: json['keywords'] as dynamic,
        creator: json['creator'] as dynamic,
        description: json['description'] as String?,
        content: json['content'] as String?,
        pubDate: json['pubDate'] as String?,
        pubDateTz: json['pubDateTZ'] as String?,
        imageUrl: json['image_url'] as String?,
        videoUrl: json['video_url'] as dynamic,
        sourceId: json['source_id'] as String?,
        sourceName: json['source_name'] as String?,
        sourcePriority: json['source_priority'] as int?,
        sourceUrl: json['source_url'] as String?,
        sourceIcon: json['source_icon'] as String?,
        language: json['language'] as String?,
        country: (json['country'] as List?)?.cast<String>(),
        category: (json['category'] as List?)?.cast<String>(),
        sentiment: json['sentiment'] as String?,
        sentimentStats: json['sentiment_stats'] as String?,
        aiTag: json['ai_tag'] as String?,
        aiRegion: json['ai_region'] as String?,
        aiOrg: json['ai_org'] as String?,
        duplicate: json['duplicate'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'article_id': articleId,
        'title': title,
        'link': link,
        'keywords': keywords,
        'creator': creator,
        'description': description,
        'content': content,
        'pubDate': pubDate,
        'pubDateTZ': pubDateTz,
        'image_url': imageUrl,
        'video_url': videoUrl,
        'source_id': sourceId,
        'source_name': sourceName,
        'source_priority': sourcePriority,
        'source_url': sourceUrl,
        'source_icon': sourceIcon,
        'language': language,
        'country': country,
        'category': category,
        'sentiment': sentiment,
        'sentiment_stats': sentimentStats,
        'ai_tag': aiTag,
        'ai_region': aiRegion,
        'ai_org': aiOrg,
        'duplicate': duplicate,
      };
}
