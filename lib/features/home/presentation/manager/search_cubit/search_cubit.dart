import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tamenny_app/core/entites/doctor_entity.dart';
import 'package:tamenny_app/core/models/doctor_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  void searchDoctors(String query) async {
    if (query.isEmpty) {
      emit(SearchInitial());
      return;
    }

    emit(SearchLoading());

    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('doctors').get();

      final doctors = snapshot.docs
          .map((doc) => DoctorModel.fromJson(doc.data()).toEntity())
          .where((doctor) =>
              doctor.name.toLowerCase().contains(query.toLowerCase()))
          .toList();

      // final doctors = snapshot.docs
      //     .map((doc) => DoctorEntity.fromMap(doc.data(), doc.id))
      //     .where((doctor) =>
      //         doctor.name.toLowerCase().contains(query.toLowerCase()))
      //     .toList();

      if (doctors.isEmpty) {
        emit(SearchEmpty());
      } else {
        emit(SearchSuccess(doctors));
      }
    } catch (e) {
      emit(SearchFailure(e.toString()));
    }
  }
}
