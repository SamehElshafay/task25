import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:task/core/errors/failure.dart';
import 'package:task/features/PopularPeople/data/datasource/remote_datasource.dart';
import 'package:task/features/PopularPeople/data/models/actor_response.dart';
import 'package:task/features/PopularPeople/domain/repository/repository.dart';

@LazySingleton(as: PopularPeopleRepository)
class PopularPeopleRepositoryImpl implements PopularPeopleRepository {
  final PopularPeopleDatasource remote;
  final PopularPeopleDatasource local;

  PopularPeopleRepositoryImpl(@Named("local") this.local, @Named("remote") this.remote);

  @override
  Future<Either<ServerFailure, ActorResponse>> getAllPopular(Map<String, dynamic> data) async {
    try {
      final remoteResult = await remote.getAllPopular(data);

      return await remoteResult.fold(
          (error) async => _getFromCacheOnError(error, data),
          (response) async => _handleRemoteSuccess(response),
      );
    } catch (_) {
      return await _getFromCache(data);
    }
  }

  Future<Either<ServerFailure, ActorResponse>> _getFromCacheOnError(ServerFailure error, Map<String, dynamic> data) async {
    if (error.message.contains("SocketException") ||
        error.message.contains("No such host") ||
        error.message.contains("timed out") ||
        error.message.contains("connection error")) {
      return await _getFromCache(data);
    }
    return Left(error);
  }

  Future<Either<ServerFailure, ActorResponse>> _handleRemoteSuccess(ActorResponse response) async {
    if (response.results != null && response.results!.isNotEmpty) {
      await local.cachePeople(response);
    }
    return Right(response);
  }

  Future<Either<ServerFailure, ActorResponse>> _getFromCache(
      Map<String, dynamic> data) async {
    final cachedResult = await local.getAllPopular(data);
    return cachedResult.fold(
      (l) => Left(ServerFailure("No cached data available")),
      (r) => Right(r),
    );
  }
}