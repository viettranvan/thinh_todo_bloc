import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/blocs/note/note_bloc.dart';
import 'package:todo_bloc/pages/add_note/bloc/add_note_bloc.dart';

import 'widgets/index.dart';

class AddNotePage extends StatelessWidget {
  const AddNotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteBloc(),
      child: BlocBuilder<NoteBloc, NoteState>(
        builder: (context, state) {
          return BlocConsumer<AddNoteBloc, AddNoteState>(
            listener: (context, state) {
              if (state is AddNoteFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.errorMessage),
                    duration: const Duration(milliseconds: 2000),
                  ),
                );
              } else if (state is AddNoteSuccess) {
                BlocProvider.of<NoteBloc>(context).add(GlobalAddNewNote(
                  newNote: state.newNote,
                ));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('add success'),
                    duration: Duration(milliseconds: 2000),
                  ),
                );
                Navigator.of(context).popUntil((route) => route.isFirst);
              }
            },
            builder: (context, state) {
              var bloc = context.read<AddNoteBloc>();
              return Scaffold(
                appBar: AppBar(
                  leadingWidth: 50,
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const SizedBox(
                      // width:0,
                      height: 16.97,
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  actions: [
                    InkWell(
                      onTap: () => _addNewNote(context),
                      child: const Icon(
                        Icons.check,
                        color: Colors.black,
                      ),
                    ),
                  ],
                  backgroundColor: Colors.white,
                  elevation: 1,
                  centerTitle: true,
                  toolbarHeight: 50,
                ),
                body: Column(
                  children: [
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: NoteActiveTextField(
                        controller: bloc.titleController,
                        hintText: 'Title',
                        onChanged: (value) {},
                      ),
                    ),
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: NoteActiveTextField(
                        controller: bloc.dateController,
                        onChanged: (value) {},
                        hintText: 'date time',
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: NoteActiveTextField(
                          controller: bloc.descriptionController,
                          onChanged: (value) {},
                          hintText: 'Description',
                          maxLines: 100,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  _addNewNote(BuildContext context) {
    context.read<AddNoteBloc>().add(AddNewNote());
  }
}
