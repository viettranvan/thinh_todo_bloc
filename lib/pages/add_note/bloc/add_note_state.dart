part of 'add_note_bloc.dart';

@immutable
abstract class AddNoteState {}

class AddNoteInitial extends AddNoteState {}

class AddNoteSuccess extends AddNoteState {
  AddNoteSuccess({required this.newNote});
  final Note newNote;
}

class AddNoteFailure extends AddNoteState {
  AddNoteFailure({required this.errorMessage});
  final String errorMessage;
}
