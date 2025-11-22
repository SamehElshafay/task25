import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/di/init_di.dart';
import 'package:task/core/utils/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/widgets/PaginationWidget.dart';
import 'package:task/features/PopularPeople/domain/services/services.dart';
import 'package:task/features/PopularPeople/presentation/cubit/popular_people_cubit.dart';
import 'package:task/features/PopularPeople/presentation/shimmer/all_popular_shimmer.dart';
import 'package:task/features/PopularPeople/presentation/widgets/person_card.dart';

class PopularPeopleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.highlightColor,
      appBar: AppBar(
        title: Text(
          'POPULAR PEOPLE',
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: AppColors.lightTextPrimary , fontSize: 20.sp),
        ),
        backgroundColor: AppColors.baseColor,
        actions: [
          IconButton(icon: const Icon(Icons.search , color: AppColors.lightTextPrimary), onPressed: () {}),
          IconButton(icon: const Icon(Icons.menu , color: AppColors.lightTextPrimary), onPressed: () {}),
        ],
      ),
      body: BlocBuilder(
        bloc: context.read<PopularPeopleCubit>()..getPopularPeople({"page": 1}),
        builder: (context, state) {
          if(state is GetActorsLoaded){
            return ListView(
              children: [
                PaginationWidget(
                  currentPage: state.actors.page! ,
                  totalPages: state.actors.totalPages! ,
                  onPageSelected: (index) {
                    context.read<PopularPeopleCubit>().getPopularPeople({"page": index});
                  },
                ),
                ...state.actors.results!.map((e) {
                  return PersonCard(
                    person: e
                  );
                }).toList(),
              ],
            );
          }
          return PopularPeopleLoadingScreen();
        },
      ),
    );
  }
}