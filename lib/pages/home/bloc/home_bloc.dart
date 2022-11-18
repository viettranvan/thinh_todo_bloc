import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:todo_bloc/mock_data/fake_data.dart';
import 'package:todo_bloc/models/index.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<GetListNoteEvent>(_getListNote);
    on<SearchNoteEvent>(_onSearch);
  }

  final TextEditingController searchController = TextEditingController();

  FutureOr<void> _getListNote(GetListNoteEvent event, Emitter<HomeState> emit) {
    try {
      var listNoteResul = listNote; // get from API
      emit(HomeSuccess(listNote: listNoteResul));
    } catch (e) {
      emit(HomeError(errorMessage: e.toString()));
    }
  }

  FutureOr<void> _onSearch(SearchNoteEvent event, Emitter<HomeState> emit) {
    try {
      if (state is HomeSuccess) {
        List<Note> result = [];
        var listNote = (state as HomeSuccess).listNote;
        result = listNote
            .where((element) => element.titleNote
                .toLowerCase()
                .contains(searchController.text.trim().toLowerCase()))
            .toList();

        emit(HomeSuccess(
          listNote: (state as HomeSuccess).listNote,
          listSearch: result,
        ));
      }
    } catch (e) {
      emit(HomeError(errorMessage: e.toString()));
    }
  }
}
