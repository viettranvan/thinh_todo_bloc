import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:todo_bloc/models/index.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc() : super(DetailInitial()) {
    on<LoadNote>(_loadNote);
    on<DeleteNote>(_onDelete);
    on<ToggleEdit>(_onToggleEdit);
    on<SubmitEditNote>(_onSubmitEdit);
  }

  final TextEditingController titleController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  bool isEditable = false;

  FutureOr<void> _loadNote(LoadNote event, Emitter<DetailState> emit) {
    titleController.text = event.note.titleNote;
    dateController.text = event.note.dateTime;
    descriptionController.text = event.note.detailsNote;

    emit(DetailLoadSuccess(note: event.note));
  }

  FutureOr<void> _onDelete(DeleteNote event, Emitter<DetailState> emit) {
    emit(DeleteSuccess(note: event.note));
  }

  FutureOr<void> _onToggleEdit(ToggleEdit event, Emitter<DetailState> emit) {
    if (state is DetailLoadSuccess) {
      isEditable = !isEditable;
      emit(DetailLoadSuccess(note: (state as DetailLoadSuccess).note));
    }
  }

  FutureOr<void> _onSubmitEdit(
      SubmitEditNote event, Emitter<DetailState> emit) {
    if (state is DetailLoadSuccess) {
      isEditable = false;
      var currentNote = (state as DetailLoadSuccess).note;

      var newNote = Note(
        color: currentNote.color,
        dateTime: dateController.text,
        detailsNote: descriptionController.text,
        titleNote: titleController.text,
      );
      newNote.id = currentNote.id;

      emit(UpdateSuccess(note: newNote));
    }
  }
}
