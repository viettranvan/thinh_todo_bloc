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
  }
  final TextEditingController titleController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  FutureOr<void> _loadNote(LoadNote event, Emitter<DetailState> emit) {
    titleController.text = event.note.titleNote;
    dateController.text = event.note.dateTime;
    descriptionController.text = event.note.detailsNote;

    emit(DetailLoadSuccess(note: event.note));
  }

  FutureOr<void> _onDelete(DeleteNote event, Emitter<DetailState> emit) {
    emit(DeleteSuccess(note: event.note));
  }
}
