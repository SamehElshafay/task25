import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:task/core/errors/failure.dart';
import 'package:task/core/network/dio_client.dart';
import 'package:task/features/PopularPeople/data/datasource/remote_datasource.dart';
import 'package:task/features/PopularPeople/data/models/actor_model.dart';
import 'package:task/features/PopularPeople/data/models/actor_response.dart';

@LazySingleton(as: PopularPeopleDatasource)
@Named("remote")
class PopularPeopleRemoteDatasourceImpl implements PopularPeopleDatasource {
  DioClient dio ;
  PopularPeopleRemoteDatasourceImpl(this.dio);

  Future<Either<ServerFailure , ActorResponse>> getAllPopular(Map<String,dynamic> data) async {
    try{
      final result = await dio.get(
        "person/popular" ,
        query: data
      );

      return Right(ActorResponse.fromJson(result.data));
    }catch(e){
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<void> cachePeople(ActorResponse list) {
    print('||||||||||||||||||||');
    throw UnimplementedError();
  }
}