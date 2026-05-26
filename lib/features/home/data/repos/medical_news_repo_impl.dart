import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:tamenny_app/core/errors/failure.dart';
import 'package:tamenny_app/core/services/medical_news_api_service.dart';
import 'package:tamenny_app/core/utils/app_keys.dart';
import 'package:tamenny_app/features/home/data/models/article_model.dart';
import 'package:tamenny_app/features/home/domain/entites/article_entity.dart';
import 'package:tamenny_app/features/home/domain/repos/medical_news_repo.dart';

class MedicalNewsRepoImpl extends MedicalNewsRepo {
  final MedicalNewsApiService _medicalNewsApiService;

  MedicalNewsRepoImpl(this._medicalNewsApiService);

  @override
  Future<Either<Failure, List<ArticleEntity>>> getLatestMedicalNews() async {
    try {
      var data = await _medicalNewsApiService.get(
          endPoint:
              'latest?apikey=${AppKeys.kMedicalNewsApiKey}&category=health&language=en&size=10');
      List<ArticleEntity> articles = [];
      for (var article in data['results']) {
        articles.add(ArticleModel.fromJson(article).toEntity());
      }
      return right(articles);
    } catch (e) {
      log('MedicalNewsRepoImpl => {getLatestMedicalNews} => ${e.toString()}');
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
