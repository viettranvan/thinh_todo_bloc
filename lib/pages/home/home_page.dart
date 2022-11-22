import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/blocs/note/note_bloc.dart';
import 'package:todo_bloc/pages/home/bloc/home_bloc.dart';
import 'package:todo_bloc/pages/index.dart';

import 'widgets/index.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return HomeBloc()..add(GetListNoteEvent());
      },
      child: BlocBuilder<NoteBloc, NoteState>(
        builder: (context, state) {
          var noteBloc = BlocProvider.of<NoteBloc>(context);
          return BlocListener<HomeBloc, HomeState>(
            listener: (context, state) {
              if (state is HomeSuccess) {
                BlocProvider.of<NoteBloc>(context).add(UpdateListNote(
                  listNote: state.listNote,
                  listSearch: state.listSearch,
                ));
              }
            },
            child: GestureDetector(
              onTapDown: (_) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Scaffold(
                resizeToAvoidBottomInset: false,
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  elevation: 1,
                  centerTitle: true,
                  toolbarHeight: 50,
                  title: const Text(
                    'Notes',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontStyle: FontStyle.normal,
                      fontSize: 18,
                      color: Colors.black,
                      letterSpacing: 0.02,
                    ),
                  ),
                ),
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      SearchNote(
                        onChanged: (value) =>
                            context.read<HomeBloc>().add(SearchNoteEvent()),
                        searchController:
                            context.read<HomeBloc>().searchController,
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: ListView.separated(
                          itemCount: noteBloc.state.listSearch.isEmpty
                              ? noteBloc.state.listNote.length
                              : noteBloc.state.listSearch.length,
                          itemBuilder: itemBuilder,
                          separatorBuilder: separatorBuilder,
                        ),
                      ),
                    ],
                  ),
                ),
                bottomNavigationBar: NoteCount(
                  noteCount: state.listNote.length,
                ),
                floatingActionButton: SizedBox(
                  width: 62,
                  height: 62,
                  child: Align(
                    alignment: const Alignment(0, -7),
                    child: FloatingActionButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const AddNotePage(),
                        ));
                      },
                      backgroundColor: Colors.black,
                      child: const Icon(Icons.add),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    var bloc = BlocProvider.of<NoteBloc>(context);

    var listSearch = bloc.state.listSearch;

    var item = listSearch.isEmpty
        ? bloc.state.listNote[index]
        : bloc.state.listSearch[index];
    return NoteItem(
      item: item,
      onTapNote: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DetailPage(
            note: item,
          ),
        ));
      },
    );
  }

  Widget separatorBuilder(BuildContext context, int index) {
    return const SizedBox(height: 10);
  }
}
