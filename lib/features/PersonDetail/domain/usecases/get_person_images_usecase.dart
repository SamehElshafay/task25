import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:task/core/errors/failure.dart';
import 'package:task/features/PersonDetail/domain/repository/repository.dart';

@injectable
class GetPersonImagesUsecase {
  final PersonDetailRepository repo;

  GetPersonImagesUsecase(this.repo);

  Future<Either<ServerFailure, List<String>>> call(int personId) => repo.getPersonImages(personId);
}