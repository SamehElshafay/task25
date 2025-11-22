// // GENERATED CODE - DO NOT MODIFY BY HAND
//
// // **************************************************************************
// // InjectableConfigGenerator
// // **************************************************************************
//
// // ignore_for_file: type=lint
// // coverage:ignore-file
//
// // ignore_for_file: no_leading_underscores_for_library_prefixes
// import 'package:get_it/get_it.dart' as _i174;
// import 'package:injectable/injectable.dart' as _i526;
// import 'package:shared_preferences/shared_preferences.dart' as _i460;
// import 'package:task/core/di/init_di.dart' as _i907;
// import 'package:task/core/network/dio_client.dart' as _i290;
// import 'package:task/features/PersonDetail/data/datasource/remote_datasource.dart'
//     as _i389;
// import 'package:task/features/PersonDetail/data/datasource/remote_datasource/remote_datasource_impl.dart'
//     as _i216;
// import 'package:task/features/PersonDetail/data/repository/repository_impl.dart'
//     as _i380;
// import 'package:task/features/PersonDetail/domain/repository/repository.dart'
//     as _i940;
// import 'package:task/features/PersonDetail/domain/services/services.dart'
//     as _i872;
// import 'package:task/features/PersonDetail/domain/services/services_impl.dart'
//     as _i789;
// import 'package:task/features/PersonDetail/domain/usecases/get_person_details_usecase.dart'
//     as _i1016;
// import 'package:task/features/PersonDetail/domain/usecases/get_person_images_usecase.dart'
//     as _i435;
// import 'package:task/features/PersonDetail/presentation/cubit/person_details_cubit.dart'
//     as _i252;
// import 'package:task/features/PopularPeople/data/datasource/local_datasource/local_datasource_impl.dart'
//     as _i1058;
// import 'package:task/features/PopularPeople/data/datasource/remote_datasource.dart'
//     as _i581;
// import 'package:task/features/PopularPeople/data/datasource/remote_datasource/remote_datasource_impl.dart'
//     as _i185;
// import 'package:task/features/PopularPeople/data/models/actor_model.dart'
//     as _i39;
// import 'package:task/features/PopularPeople/data/models/actor_response.dart'
//     as _i460;
// import 'package:task/features/PopularPeople/data/repository/repository_impl.dart'
//     as _i649;
// import 'package:task/features/PopularPeople/domain/repository/repository.dart'
//     as _i310;
// import 'package:task/features/PopularPeople/domain/services/services.dart'
//     as _i28;
// import 'package:task/features/PopularPeople/domain/services/services_impl.dart'
//     as _i335;
// import 'package:task/features/PopularPeople/domain/usecases/get_all_popular_usecase.dart'
//     as _i46;
// import 'package:task/features/PopularPeople/presentation/cubit/popular_people_cubit.dart'
//     as _i156;
//
// extension GetItInjectableX on _i174.GetIt {
// // initializes the registration of main-scope dependencies inside of GetIt
//   Future<_i174.GetIt> init({
//     String? environment,
//     _i526.EnvironmentFilter? environmentFilter,
//   }) async {
//     final gh = _i526.GetItHelper(
//       this,
//       environment,
//       environmentFilter,
//     );
//     final registerModule = _$RegisterModule();
//     await gh.factoryAsync<_i460.SharedPreferences>(
//       () => registerModule.prefs,
//       preResolve: true,
//     );
//     gh.factory<_i290.DioClient>(() => _i290.DioClient());
//     gh.lazySingleton<_i581.PopularPeopleDatasource>(
//       () => _i1058.PopularPeopleLocalDatasourceImpl(),
//       instanceName: 'local',
//     );
//     gh.factory<_i460.ActorResponse>(() => _i460.ActorResponse(
//           page: gh<int>(),
//           results: gh<List<_i39.ActorModel>>(),
//           totalPages: gh<int>(),
//           totalResults: gh<int>(),
//         ));
//     gh.lazySingleton<_i389.PersonDetailDatasource>(
//         () => _i216.PersonDetailRemoteDatasourceImpl(gh<_i290.DioClient>()));
//     gh.lazySingleton<_i581.PopularPeopleDatasource>(
//       () => _i185.PopularPeopleRemoteDatasourceImpl(gh<_i290.DioClient>()),
//       instanceName: 'remote',
//     );
//     gh.factory<_i39.ActorModel>(() => _i39.ActorModel(
//           adult: gh<bool>(),
//           gender: gh<int>(),
//           id: gh<int>(),
//           knownForDepartment: gh<String>(),
//           name: gh<String>(),
//           originalName: gh<String>(),
//           popularity: gh<double>(),
//           profilePath: gh<String>(),
//           knownFor: gh<List<_i39.KnownFor>>(),
//         ));
//     gh.lazySingleton<_i940.PersonDetailRepository>(() =>
//         _i380.PersonDetailRepositoryImpl(gh<_i389.PersonDetailDatasource>()));
//     gh.lazySingleton<_i310.PopularPeopleRepository>(
//         () => _i649.PopularPeopleRepositoryImpl(
//               gh<_i581.PopularPeopleDatasource>(instanceName: 'local'),
//               gh<_i581.PopularPeopleDatasource>(instanceName: 'remote'),
//             ));
//     gh.factory<_i1016.GetPersonDetailsUsecase>(() =>
//         _i1016.GetPersonDetailsUsecase(gh<_i940.PersonDetailRepository>()));
//     gh.factory<_i435.GetPersonImagesUsecase>(
//         () => _i435.GetPersonImagesUsecase(gh<_i940.PersonDetailRepository>()));
//     gh.lazySingleton<_i872.PersonDetailService>(
//         () => _i789.PersonDetailServiceImpl(
//               gh<_i1016.GetPersonDetailsUsecase>(),
//               gh<_i435.GetPersonImagesUsecase>(),
//             ));
//     gh.factory<_i252.PersonDetailsCubit>(
//         () => _i252.PersonDetailsCubit(gh<_i872.PersonDetailService>()));
//     gh.factory<_i46.GetAllPopularUsecase>(
//         () => _i46.GetAllPopularUsecase(gh<_i310.PopularPeopleRepository>()));
//     gh.lazySingleton<_i28.PopularPeopleService>(
//         () => _i335.PopularPeopleServiceImpl(gh<_i46.GetAllPopularUsecase>()));
//     gh.factory<_i156.PopularPeopleCubit>(
//         () => _i156.PopularPeopleCubit(gh<_i28.PopularPeopleService>()));
//     return this;
//   }
// }
//
// class _$RegisterModule extends _i907.RegisterModule {}
