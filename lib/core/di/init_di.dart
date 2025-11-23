import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/core/network/dio_client.dart';
import 'package:task/core/utils/cache_helper.dart';
import 'package:task/features/PersonDetail/data/datasource/remote_datasource.dart';
import 'package:task/features/PersonDetail/data/datasource/remote_datasource/remote_datasource_impl.dart';
import 'package:task/features/PersonDetail/data/repository/repository_impl.dart';
import 'package:task/features/PersonDetail/domain/repository/repository.dart';
import 'package:task/features/PersonDetail/domain/services/services.dart';
import 'package:task/features/PersonDetail/domain/services/services_impl.dart';
import 'package:task/features/PersonDetail/domain/usecases/get_person_details_usecase.dart';
import 'package:task/features/PersonDetail/domain/usecases/get_person_images_usecase.dart';
import 'package:task/features/PersonDetail/presentation/cubit/person_details_cubit.dart';
import 'package:task/features/PopularPeople/data/datasource/local_datasource/local_datasource_impl.dart';
import 'package:task/features/PopularPeople/data/datasource/remote_datasource.dart';
import 'package:task/features/PopularPeople/data/datasource/remote_datasource/remote_datasource_impl.dart';
import 'package:task/features/PopularPeople/data/repository/repository_impl.dart';
import 'package:task/features/PopularPeople/domain/repository/repository.dart';
import 'package:task/features/PopularPeople/domain/services/services.dart';
import 'package:task/features/PopularPeople/domain/services/services_impl.dart';
import 'package:task/features/PopularPeople/domain/usecases/get_all_popular_usecase.dart';
import 'package:task/features/PopularPeople/presentation/cubit/popular_people_cubit.dart';

final sl = GetIt.instance..allowReassignment = true;

Future<void> initGetIt() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<CacheHelper>(() => CacheImplementation(sharedPreferences));

  sl.registerLazySingleton<DioClient>(() => DioClient());
  sl.registerLazySingleton<PersonDetailDatasource>(
          () => PersonDetailRemoteDatasourceImpl(sl<DioClient>())
  );
  sl.registerLazySingleton<PersonDetailRepository>(
          () => PersonDetailRepositoryImpl(sl<PersonDetailDatasource>())
  );

  sl.registerFactory(() => GetPersonDetailsUsecase(sl()));
  sl.registerFactory(() => GetPersonImagesUsecase(sl()));
  sl.registerLazySingleton<PersonDetailService>(
          () => PersonDetailServiceImpl(
        sl<GetPersonDetailsUsecase>(),
        sl<GetPersonImagesUsecase>(),
      )
  );

  sl.registerFactory(() => PersonDetailsCubit(sl<PersonDetailService>()));

  sl.registerLazySingleton<PopularPeopleDatasource>(
        () => PopularPeopleLocalDatasourceImpl(sl<CacheHelper>()),
    instanceName: "local",
  );

  sl.registerLazySingleton<PopularPeopleDatasource>(
        () => PopularPeopleRemoteDatasourceImpl(sl<DioClient>()),
    instanceName: "remote",
  );

  sl.registerLazySingleton<PopularPeopleRepository>(
        () => PopularPeopleRepositoryImpl(
      sl<PopularPeopleDatasource>(instanceName: "local"),
      sl<PopularPeopleDatasource>(instanceName: "remote"),
    ),
  );

  sl.registerFactory(() => GetAllPopularUsecase(sl()));

  sl.registerLazySingleton<PopularPeopleService>(
      () => PopularPeopleServiceImpl(sl<GetAllPopularUsecase>())
  );

  sl.registerFactory(() => PopularPeopleCubit(sl<PopularPeopleService>()));
}