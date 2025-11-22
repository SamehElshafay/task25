import 'package:dartz/dartz.dart';
import 'package:task/core/errors/failure.dart';
import 'package:task/features/PopularPeople/data/models/actor_model.dart';

abstract class PersonDetailDatasource{
  Future<Either<ServerFailure, ActorModel>> getPersonDetails(int personId);
  Future<Either<ServerFailure, List<String>>> getPersonImages(int personId);
}
