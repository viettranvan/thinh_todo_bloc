import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:todo_bloc/models/index.dart';

part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  NoteBloc()
      : super(const NoteInitial(
          listNote: [],
          listSearch: [],
        )) {
    on<UpdateListNote>(_onUpdate);
    on<GlobalAddNewNote>(_onAddNewNote);
  }

  FutureOr<void> _onUpdate(UpdateListNote event, Emitter<NoteState> emit) {
    emit(NoteInitial(
      listNote: event.listNote,
      listSearch: event.listSearch,
    ));
  }

  FutureOr<void> _onAddNewNote(
      GlobalAddNewNote event, Emitter<NoteState> emit) {
    var newList = [...state.listNote];

    newList.add(event.newNote);

    emit(NoteInitial(
      listNote: newList,
      listSearch: [],
    ));
  }
}
