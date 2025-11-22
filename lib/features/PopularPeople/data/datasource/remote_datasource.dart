import 'package:dartz/dartz.dart';
import 'package:task/core/errors/failure.dart';
import 'package:task/features/PopularPeople/data/models/actor_model.dart';
import 'package:task/features/PopularPeople/data/models/actor_response.dart';

abstract class PopularPeopleDatasource{
  Future<Either<ServerFailure , ActorResponse>> getAllPopular(Map<String,dynamic> data) ;
  Future<void> cachePeople(ActorResponse list) ;
}
