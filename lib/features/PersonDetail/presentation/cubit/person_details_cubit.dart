import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:gallery_saver_plus/gallery_saver.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:task/features/PersonDetail/domain/services/services.dart';
import 'package:task/features/PopularPeople/data/models/actor_model.dart';

part 'person_details_state.dart';

@injectable
class PersonDetailsCubit extends Cubit<PersonDetailsState> {
  PersonDetailService service ;
  PersonDetailsCubit(this.service) : super(PersonDetailsInitial());

  Future<void> getPersonImages(int id) async {
    emit(PersonLoading());
    final result = await service.getPersonImages(id);
    result.fold(
      (error) {
        emit(PersonError(error.message));
      },
      (images) {
        if(images.isEmpty)
          emit(EmptyPersonImages());
        else
          emit(PersonImagesLoaded(images));
      }
    );
  }

  Future<void> getPersonDetails(int id) async {
    emit(PersonLoading());
    final result = await service.getPersonDetails(id);
    result.fold(
      (error) {
        emit(PersonError(error.message));
      },
      (person) {
        emit(PersonDetailsLoaded(person));
      }
    );
  }

  Future<void> saveImage(String url) async {
    emit(SavingImageLoading());
    try {
      final dio = Dio();
      final response = await dio.get(
        url,
        options: Options(responseType: ResponseType.bytes),
      );

      final tempDir = await getTemporaryDirectory();
      final filePath = "${tempDir.path}/my_image_${DateTime.now().millisecondsSinceEpoch}.jpg";
      final file = File(filePath);
      await file.writeAsBytes(response.data);

      final result = await GallerySaver.saveImage(
        file.path,
        albumName: "images",
      );

      if (result == true) {
        emit(SavingImageSuccess());
      } else {
        emit(SavingImageError());
      }
    } catch (e) {
      emit(SavingImageError());
    }
  }
}