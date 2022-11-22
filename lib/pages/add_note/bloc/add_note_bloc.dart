import 'dart:async';
import 'dart:math' as math;

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:todo_bloc/models/index.dart';

part 'add_note_event.dart';
part 'add_note_state.dart';

class AddNoteBloc extends Bloc<AddNoteEvent, AddNoteState> {
  AddNoteBloc() : super(AddNoteInitial()) {
    on<AddNewNote>(_addNewNote);
  }
  final TextEditingController titleController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  FutureOr<void> _addNewNote(AddNewNote event, Emitter<AddNoteState> emit) {
    if (!checkValidate()) {
      var newNote = Note(
        titleNote: titleController.text,
        dateTime: dateController.text,
        detailsNote: descriptionController.text,
        color: getRandomColor(),
      );

      emit(AddNoteSuccess(newNote: newNote));
    } else {
      emit(AddNoteFailure(errorMessage: 'Please fill all fields.'));
    }
  }

  bool checkValidate() {
    return (titleController.text.isEmpty ||
        dateController.text.isEmpty ||
        descriptionController.text.isEmpty);
  }
}

Color getRandomColor() {
  return Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
      .withOpacity(1.0);
}
