import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:task/core/errors/failure.dart';
import 'package:task/features/PopularPeople/data/models/actor_model.dart';
import 'package:task/features/PopularPeople/data/models/actor_response.dart';
import 'package:task/features/PopularPeople/domain/repository/repository.dart';

@injectable
class GetAllPopularUsecase {
  PopularPeopleRepository repo ;
  GetAllPopularUsecase(this.repo) ;

  Future<Either<ServerFailure , ActorResponse>> call(Map<String,dynamic> data) => repo.getAllPopular(data);
}