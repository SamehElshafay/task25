import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:task/features/PopularPeople/data/models/actor_model.dart';
import 'package:task/features/PopularPeople/data/models/actor_response.dart';
import 'package:task/features/PopularPeople/domain/services/services.dart';

part 'popular_people_state.dart';

@injectable
class PopularPeopleCubit extends Cubit<PopularPeopleState> {
  PopularPeopleService services ;
  PopularPeopleCubit(this.services) : super(PopularPeopleInitial());

  Future<void> getPopularPeople(Map<String,dynamic> data) async {
    emit(GetActorsLoading());
    final result = await services.getAllPopular(data);

    result.fold(
      (error) {
        emit(GetActorsLoadingError(error.message));
      },
      (actors) {
        emit(GetActorsLoaded(actors));
      },
    );
  }

}
