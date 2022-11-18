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
  }

  FutureOr<void> _onUpdate(UpdateListNote event, Emitter<NoteState> emit) {
    emit(NoteInitial(
      listNote: event.listNote,
      listSearch: event.listSearch,
    ));
  }
}
