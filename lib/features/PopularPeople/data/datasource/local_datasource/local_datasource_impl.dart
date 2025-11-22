import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:task/core/errors/failure.dart';
import 'package:task/core/utils/cache_helper.dart';
import 'package:task/features/PopularPeople/data/datasource/remote_datasource.dart';
import 'package:task/features/PopularPeople/data/models/actor_response.dart';

@LazySingleton(as: PopularPeopleDatasource)
@Named("local")
class PopularPeopleLocalDatasourceImpl implements PopularPeopleDatasource {
  static const String cacheKey = "popular_people_response";

  final CacheHelper cacheHelper;

  PopularPeopleLocalDatasourceImpl(this.cacheHelper);

  Future<void> cachePeople(ActorResponse response) async {
    await cacheHelper.put(cacheKey, response.toJson());
  }

  @override
  Future<Either<ServerFailure, ActorResponse>> getAllPopular(Map<String, dynamic> data) async {
    try {
      final exists = await cacheHelper.has(cacheKey);

      if (!exists) {
        return Left(ServerFailure("No Cached Data"));
      }

      final cachedJson = await cacheHelper.get(cacheKey) as Map<String, dynamic>;
      final cachedResponse = ActorResponse.fromJson(cachedJson);

      return Right(cachedResponse);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}