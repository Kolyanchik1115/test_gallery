part of 'photo_bloc.dart';

abstract class PhotoState {}

class PhotoInitialState extends PhotoState {}

class PhotoLoadedState extends PhotoState {
  final List<Photo> photos;
  PhotoLoadedState(this.photos);
}
