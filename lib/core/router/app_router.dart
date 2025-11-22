import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task/core/di/init_di.dart';
import 'package:task/features/PersonDetail/domain/services/services.dart';
import 'package:task/features/PersonDetail/presentation/cubit/person_details_cubit.dart';
import 'package:task/features/PersonDetail/presentation/pages/PersonDetail_screen.dart';
import 'package:task/features/PersonDetail/presentation/pages/actor_image.dart';
import 'package:task/features/PopularPeople/domain/services/services.dart';
import 'package:task/features/PopularPeople/presentation/cubit/popular_people_cubit.dart';
import 'package:task/features/PopularPeople/presentation/pages/popular_people_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/home',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          extendBody: true,
          body: Directionality(
            textDirection: TextDirection.rtl,
            child: child,
          ),
        );
      },
      routes: [
        GoRoute(
          path: '/home',
          builder: (_, __) => BlocProvider<PopularPeopleCubit>(
            create: (context) => PopularPeopleCubit(sl<PopularPeopleService>()),
            child: PopularPeopleScreen(),
          ),
          routes: [
            GoRoute(
              path: "/person_screen/:id",
              builder: (context, state) {
                final id = state.pathParameters['id']!;
                return BlocProvider<PersonDetailsCubit>(
                  create: (context) => PersonDetailsCubit(sl<PersonDetailService>()),
                  child: PersonDetailScreen(personID: int.parse(id)),
                );
              },
              routes: [
                GoRoute(
                  path: "/image_screen/:imageUrl",
                  builder: (context, state) {
                    final imageUrl = state.pathParameters['imageUrl']!;
                    return BlocProvider<PersonDetailsCubit>(
                      create: (context) => PersonDetailsCubit(sl<PersonDetailService>()),
                      child: ActorImage(imageUrl: imageUrl),
                    );
                  },
                ),
              ]
            ),
          ]
        ),
      ],
    ),
  ],
);