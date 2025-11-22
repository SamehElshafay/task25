import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/di/init_di.dart';
import 'package:task/core/utils/app_colors.dart';
import 'package:task/features/PersonDetail/domain/services/services.dart';
import 'package:task/features/PersonDetail/presentation/cubit/person_details_cubit.dart';
import 'package:task/features/PersonDetail/presentation/shimmer/shimmer.dart';
import 'package:task/features/PersonDetail/presentation/widgets/actor_details.dart';
import 'package:task/features/PersonDetail/presentation/widgets/actor_images.dart';

class PersonDetailScreen extends StatelessWidget {
  final int personID ;
  PersonDetailScreen({super.key, required this.personID});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: AppColors.baseColor,
        appBar: AppBar(
          backgroundColor: AppColors.baseColor,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: AppColors.lightTextPrimary),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text(
            'person details',
            style: TextStyle(color: AppColors.lightTextPrimary, fontSize: 18),
          ),
          centerTitle: true,
        ),
        body: BlocBuilder(
          bloc: context.read<PersonDetailsCubit>()..getPersonDetails(personID),
          builder: (context, state) {
            if(state is PersonDetailsLoaded){
              return ActorDetails(person: state.person);
            }
            return PersonDetailShimmer();
          },
        ),
      ),
    );
  }
}