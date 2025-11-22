import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:task/core/errors/failure.dart';
import 'package:task/core/network/dio_client.dart';
import 'package:task/features/PersonDetail/data/datasource/remote_datasource.dart';
import 'package:task/features/PopularPeople/data/models/actor_model.dart';

@LazySingleton(as: PersonDetailDatasource)
class PersonDetailRemoteDatasourceImpl implements PersonDetailDatasource {
  DioClient dio ;

  PersonDetailRemoteDatasourceImpl(this.dio);

  Future<Either<ServerFailure, ActorModel>> getPersonDetails(int personId) async {
    try {
      final result = await dio.get("person/$personId");

      return Right(ActorModel.fromJson(result.data));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<ServerFailure, List<String>>> getPersonImages(int personId) async {
    try {
      final result = await dio.get("person/$personId/images");

      return Right(
          (result.data["profiles"] as List)
              .map<String>((image) => image["file_path"].toString())
              .toList()
      );
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
