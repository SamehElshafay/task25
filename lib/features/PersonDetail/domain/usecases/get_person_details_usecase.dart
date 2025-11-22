import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:task/core/errors/failure.dart';
import 'package:task/features/PersonDetail/domain/repository/repository.dart';
import 'package:task/features/PopularPeople/data/models/actor_model.dart';

@injectable
class GetPersonDetailsUsecase {
  final PersonDetailRepository repo;

  GetPersonDetailsUsecase(this.repo);

  Future<Either<ServerFailure, ActorModel>> call(int personId) => repo.getPersonDetails(personId);
}
