import 'package:flutter/material.dart';
import 'package:task/core/utils/app_colors.dart';
import 'package:task/features/PersonDetail/presentation/widgets/actor_images.dart';
import 'package:task/features/PopularPeople/data/models/actor_model.dart';

class ActorDetails extends StatelessWidget {
  final ActorModel person;
  const ActorDetails({super.key,required this.person});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 128,
                height: 128,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.secondary,
                    width: 2.0,
                  ),
                ),
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(person.profilePath.toString()) ,
                  backgroundColor: AppColors.highlightColor,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              person.name.toString() ,
              style: TextStyle(color: AppColors.lightTextPrimary, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Known for: ${person.knownForDepartment}', style: TextStyle(color: AppColors.lightTextSecondary)),
                Text('adult: ${person.adult! ? "Yes" : "No"}', style: TextStyle(color: AppColors.lightTextSecondary)),
                Text('gender: ${person.gender == 1 ? "female" : "male"}', style: TextStyle(color: AppColors.lightTextSecondary)),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              person.name.toString(),
              style: TextStyle(color: AppColors.lightTextSecondary),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 24),

            const Text(
              'Images',
              style: TextStyle(color: AppColors.lightTextPrimary, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ActorImages(actorID: person.id!),
          ],
        ),
      ),
    );
  }
}