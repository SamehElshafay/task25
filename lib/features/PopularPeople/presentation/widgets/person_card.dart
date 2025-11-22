import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:task/core/utils/app_colors.dart';
import 'package:task/features/PopularPeople/data/models/actor_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PersonCard extends StatelessWidget {
  final ActorModel person;
  const PersonCard({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      color: AppColors.baseColor,
      child: InkWell(
        onTap: () {
          context.go("/home/person_screen/${person.id}");
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: <Widget>[
              Icon(Icons.chevron_left, color: AppColors.lightTextSecondary),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.percentageCardColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  person.popularity.toString() ,
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    // color: AppColors.lightTextPrimary ,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      person.name.toString() ,
                      style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: AppColors.lightTextPrimary ,
                        fontSize: 16.sp,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      person.knownForDepartment.toString(),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.lightTextSecondary
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              if(person.profilePath != null)
                CircleAvatar(
                  radius: 28,
                  backgroundColor: AppColors.disabled,
                  backgroundImage: person.profilePath != null && person.profilePath!.isNotEmpty ? CachedNetworkImageProvider("${person.profilePath}") : null,
                  onBackgroundImageError: (exception, stackTrace) {
                    debugPrint('$exception');
                  },
                  child: person.profilePath == null || person.profilePath!.isEmpty ? Icon(Icons.person, color: AppColors.card, size: 30) : null,
                ),
            ],
          ),
        ),
      ),
    );
  }
}