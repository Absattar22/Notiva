import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notiva/cubits/notes_cubit/notes_cubit.dart';
import 'package:notiva/models/note_model.dart';
import 'package:notiva/widgets/custom_note_item.dart';

class NotesListBuilder extends StatelessWidget {
  final List<NoteModel>? notes;

  const NotesListBuilder({super.key, this.notes});

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
        final notesToDisplay = notes ?? BlocProvider.of<NotesCubit>(context).notes!;

        if (notesToDisplay.isEmpty) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 100),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset('assets/images/no-notes.gif'),
                  const Text(
                    'No Notes Found',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: notesToDisplay.length,
            itemBuilder: (context, index) {
              int reverseIndex = notesToDisplay.length - 1 - index;
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: NotesItem(note: notesToDisplay[reverseIndex]),
              );
            },
          );
        }
      },
    );
  }
}
