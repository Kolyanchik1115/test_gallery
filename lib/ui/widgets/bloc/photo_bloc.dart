import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_simple/domain/api/api.dart';
import 'package:gallery_simple/domain/entity/photos.dart';

part 'photo_event.dart';
part 'photo_state.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  final _dataService = PhotoProvider();
  int page = 1;
  var oldPhotos = <Photo>[];

  PhotoBloc() : super(PhotoInitialState()) {
    on<PhotoEvent>(
      (event, emit) async {
        final gallery = await _dataService.getPhotos(page);
        for (var photo in gallery) {
          page++;
          oldPhotos.add(photo);
          emit(PhotoLoadedState(oldPhotos));
        }
      },
    );
  }
}
