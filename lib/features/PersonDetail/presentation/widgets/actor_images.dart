import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task/core/di/init_di.dart';
import 'package:task/core/utils/app_colors.dart';
import 'package:task/core/utils/constants.dart';
import 'package:task/features/PersonDetail/domain/services/services.dart';
import 'package:task/features/PersonDetail/presentation/cubit/person_details_cubit.dart';
import 'package:task/features/PersonDetail/presentation/shimmer/image_shimmer.dart';

class ActorImages extends StatelessWidget {
  final PersonDetailsCubit cubit = PersonDetailsCubit(sl<PersonDetailService>());
  final int actorID ;
  ActorImages({super.key, required this.actorID});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: cubit..getPersonImages(actorID),
      builder: (context, state) {
        if(state is PersonImagesLoaded){
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.images.length ,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  context.go("/home/person_screen/${actorID}/image_screen/${state.images[index].toString().replaceAll("/", "")}");
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    Constants.imagesUrl+state.images[index].toString(),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          );
        }
        else if(state is EmptyPersonImages){
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            decoration: BoxDecoration(
              color: AppColors.baseColor,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.camera_alt_outlined, color: AppColors.lightTextSecondary),
                SizedBox(width: 8),
                Text('No images available', style: TextStyle(color: AppColors.lightTextSecondary)),
              ],
            ),
          );
        }
        return PersonImagesShimmer();
      },
    );
  }
}
