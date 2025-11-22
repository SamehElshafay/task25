import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:task/core/errors/failure.dart';
import 'package:task/features/PersonDetail/domain/services/services.dart';
import 'package:task/features/PersonDetail/domain/usecases/get_person_details_usecase.dart';
import 'package:task/features/PersonDetail/domain/usecases/get_person_images_usecase.dart';
import 'package:task/features/PopularPeople/data/models/actor_model.dart';

@LazySingleton(as: PersonDetailService)
class PersonDetailServiceImpl implements PersonDetailService {
  GetPersonDetailsUsecase _getPersonDetailsUsecase ;
  GetPersonImagesUsecase _getPersonImagesUsecase ;
  PersonDetailServiceImpl(this._getPersonDetailsUsecase , this._getPersonImagesUsecase);
  Future<Either<ServerFailure, ActorModel>> getPersonDetails(int personId) => _getPersonDetailsUsecase(personId);
  Future<Either<ServerFailure, List<String>>> getPersonImages(int personId) => _getPersonImagesUsecase(personId);
}
