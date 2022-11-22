part of 'detail_bloc.dart';

@immutable
abstract class DetailState {}

class DetailInitial extends DetailState {}

class DetailLoadSuccess extends DetailState {
  DetailLoadSuccess({required this.note});
  final Note note;
}

class DeleteSuccess extends DetailState {
  DeleteSuccess({required this.note});
  final Note note;
}

class UpdateSuccess extends DetailState {
  UpdateSuccess({required this.note});
  final Note note;
}

class DetailLoadError extends DetailState {
  DetailLoadError({required this.errorMessage});
  final String errorMessage;
}


