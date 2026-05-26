import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:tamenny_app/core/utils/app_assets.dart';
import 'package:tamenny_app/features/home/presentation/manager/search_cubit/search_cubit.dart';
import 'package:tamenny_app/features/home/presentation/views/widgets/nearby_doctors_sliver_list.dart';
import 'package:tamenny_app/features/home/presentation/views/widgets/search_text_field.dart';
import 'package:tamenny_app/generated/l10n.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          SearchTextField(
            onChanged: (query) =>
                context.read<SearchCubit>().searchDoctors(query),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state is SearchLoading) {
                  return const Center(
                      // child: Lottie.asset('assets/lottie/searching.json'),
                      );
                } else if (state is SearchSuccess) {
                  return CustomScrollView(
                    slivers: [
                      NearbyDoctorsSliverList(
                        doctors: state.doctors,
                        length: state.doctors.length,
                      )
                    ],
                  );
                } else if (state is SearchEmpty) {
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Lottie.asset(
                          Assets.imagesNoData,
                          width: 200,
                          height: 200,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          S.of(context).no_results,
                        ),
                      ],
                    ),
                  );
                } else if (state is SearchFailure) {
                  return Center(
                      child: Text(
                          '${S.of(context).error_occurred}${state.error}'));
                } else {
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Lottie.asset(
                          Assets.imagesTyping,
                          width: 200,
                          height: 200,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          S.of(context).start_typing_to_search,
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
