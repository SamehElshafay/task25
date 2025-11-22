part of 'popular_people_cubit.dart';

@immutable
sealed class PopularPeopleState {}

final class PopularPeopleInitial extends PopularPeopleState {}

final class GetActorsLoading extends PopularPeopleState {}
final class GetActorsLoadingError extends PopularPeopleState {
  String message ;
  GetActorsLoadingError(this.message);
}
final class GetActorsLoaded extends PopularPeopleState {
  ActorResponse actors ;
  GetActorsLoaded(this.actors);
}
