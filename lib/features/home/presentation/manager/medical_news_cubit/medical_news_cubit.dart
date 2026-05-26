import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tamenny_app/features/home/domain/entites/article_entity.dart';
import 'package:tamenny_app/features/home/domain/repos/medical_news_repo.dart';

part 'medical_news_state.dart';

class MedicalNewsCubit extends Cubit<MedicalNewsState> {
  MedicalNewsCubit(this.medicalNewsRepo) : super(MedicalNewsInitial());

  final MedicalNewsRepo medicalNewsRepo;
  List<ArticleEntity> articlesList = [];

  getMedicalNews() async {
    emit(MedicalNewsLoading());
    var result = await medicalNewsRepo.getLatestMedicalNews();
    result.fold((f) => emit(MedicalNewsFailure(errMessage: f.errMessage)),
        (articles) {
      articlesList = articles;
      emit(MedicalNewsSuccess(articles: articles));
    });
  }
}
