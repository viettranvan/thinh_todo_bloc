part of 'note_bloc.dart';

abstract class NoteEvent {}

class UpdateListNote extends NoteEvent {
  final List<Note> listNote;
  final List<Note> listSearch;

  UpdateListNote({required this.listNote,required this.listSearch});
}
