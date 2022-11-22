part of 'note_bloc.dart';

abstract class NoteEvent {}

class UpdateListNote extends NoteEvent {
  final List<Note> listNote;
  final List<Note> listSearch;

  UpdateListNote({required this.listNote, required this.listSearch});
}

class GlobalAddNewNote extends NoteEvent {
  GlobalAddNewNote({required this.newNote});
  final Note newNote;
}

class GlobalDeleteNote extends NoteEvent {
  GlobalDeleteNote({required this.note});
  final Note note;
}
