import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:task/core/errors/failure.dart';
import 'package:task/features/PersonDetail/data/datasource/remote_datasource.dart';
import 'package:task/features/PersonDetail/domain/repository/repository.dart';
import 'package:task/features/PopularPeople/data/models/actor_model.dart';

@LazySingleton(as: PersonDetailRepository)
class PersonDetailRepositoryImpl implements PersonDetailRepository {
  PersonDetailDatasource datasource ;
  PersonDetailRepositoryImpl(this.datasource);

  Future<Either<ServerFailure, ActorModel>> getPersonDetails(int personId) => datasource.getPersonDetails(personId);
  Future<Either<ServerFailure, List<String>>> getPersonImages(int personId) => datasource.getPersonImages(personId);
}
