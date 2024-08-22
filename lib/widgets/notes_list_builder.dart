import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notiva/cubits/notes_cubit/notes_cubit.dart';
import 'package:notiva/models/note_model.dart';
import 'package:notiva/widgets/custom_note_item.dart';

class NotesListBuilder extends StatelessWidget {
  const NotesListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        if (state is NotesLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: Color.fromARGB(255, 24, 122, 220),
            ),
          );
        }
        List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes!;

        if (notes.isEmpty) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/no-notes.gif'),
              const Text(
                'No notes yet',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ],
          );
        } else {
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: notes.length,
            itemBuilder: (context, index) {
              int reverseIndex = notes.length - 1 - index;
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: NotesItem(note: notes[reverseIndex]),
              );
            },
          );
        }
      },
    );
  }
}
