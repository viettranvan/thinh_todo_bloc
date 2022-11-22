import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/blocs/note/note_bloc.dart';
import 'package:todo_bloc/models/index.dart';
import 'package:todo_bloc/pages/detail/bloc/detail_bloc.dart';
import 'package:todo_bloc/pages/index.dart';

import 'widgets/index.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.note});

  final Note note;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailBloc()..add(LoadNote(note: note)),
      child: BlocConsumer<DetailBloc, DetailState>(
        listener: (context, state) {
          if (state is DeleteSuccess) {
            BlocProvider.of<NoteBloc>(context).add(GlobalDeleteNote(
              note: state.note,
            ));
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Delete success'),
                duration: Duration(milliseconds: 2000),
              ),
            );
            Navigator.pop(context);
          }else if (state is UpdateSuccess) {
            BlocProvider.of<NoteBloc>(context).add(GlobalUpdateNote(
              note: state.note,
            ));
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Update success'),
                duration: Duration(milliseconds: 2000),
              ),
            );
          }
        },
        builder: (context, state) {
          var bloc = context.read<DetailBloc>();
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
                  child: NoteTextField(
                    controller: bloc.titleController,
                    editable: bloc.isEditable,
                  ),
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: NoteTextField(
                    controller: bloc.dateController,
                    editable: bloc.isEditable,
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
                    child: NoteTextField(
                      editable: bloc.isEditable,
                      controller: bloc.descriptionController,
                      maxLines: 100,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(boxShadow: [
                    BoxShadow(
                        blurRadius: 4,
                        offset: Offset(0, -4),
                        color: Color(0x26B7B7B7))
                  ], color: Colors.white),
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () => _onDelete(context),
                          child: const Icon(Icons.delete),
                        ),
                        InkWell(
                          onTap: () => _onAdd(context),
                          child: const Icon(Icons.add),
                        ),
                        bloc.isEditable
                            ? InkWell(
                                onTap: () => _submitEditNote(context),
                                child: const Icon(Icons.check),
                              )
                            : InkWell(
                                onTap: () => _onEdit(context),
                                child: const Icon(Icons.edit),
                              ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  _onDelete(BuildContext context) {
    BlocProvider.of<DetailBloc>(context).add(DeleteNote(note: note));
  }

  _onAdd(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const AddNotePage(),
    ));
  }

  _onEdit(BuildContext context) {
    var bloc = context.read<DetailBloc>();
    bloc.add(ToggleEdit());
  }

  _submitEditNote(BuildContext context) {
    var bloc = context.read<DetailBloc>();
    bloc.add(SubmitEditNote());
  }
}
