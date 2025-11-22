part of 'person_details_cubit.dart';

@immutable
sealed class PersonDetailsState {}

final class PersonDetailsInitial extends PersonDetailsState {}

class PersonLoading extends PersonDetailsState {}

class PersonDetailsLoaded extends PersonDetailsState {
  final ActorModel person;

  PersonDetailsLoaded(this.person);
}

class PersonImagesLoaded extends PersonDetailsState {
  final List<String> images;

  PersonImagesLoaded(this.images);
}

class EmptyPersonImages extends PersonDetailsState {}

class PersonError extends PersonDetailsState {
  final String message;
  PersonError(this.message);
}

class SavingImageLoading extends PersonDetailsState {}
class SavingImageSuccess extends PersonDetailsState {}
class SavingImageError extends PersonDetailsState {}