import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:task/core/errors/failure.dart';
import 'package:task/features/PopularPeople/data/models/actor_response.dart';
import 'package:task/features/PopularPeople/domain/services/services.dart';
import 'package:task/features/PopularPeople/domain/usecases/get_all_popular_usecase.dart';

@LazySingleton(as: PopularPeopleService)
class PopularPeopleServiceImpl implements PopularPeopleService {
  GetAllPopularUsecase _getAllPopularUsecase ;
  PopularPeopleServiceImpl(this._getAllPopularUsecase);

  Future<Either<ServerFailure , ActorResponse>> getAllPopular(Map<String,dynamic> data) => _getAllPopularUsecase(data);
}
