import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart'; // Import the Slidable package
import 'package:notiva/cubits/notes_cubit/notes_cubit.dart';
import 'package:notiva/helper/snack_bar.dart';
import 'package:notiva/models/note_model.dart';
import 'package:notiva/views/edit_note_screen.dart';

class NotesItem extends StatelessWidget {
  const NotesItem({super.key, required this.note});

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(note),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              BlocProvider.of<NotesCubit>(context).deleteNote(note);
              ShowSnackBar(context, 'Note Deleted Successfully',
                  const Color.fromARGB(255, 211, 14, 14), Icons.check);
            },
            backgroundColor: const Color.fromARGB(255, 221, 14, 52),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return EditNoteScreen(note: note);
          }));
        },
        child: Container(
          padding: const EdgeInsets.only(left: 16.0, top: 24.0, bottom: 24.0),
          decoration: BoxDecoration(
            color: Color(note.color),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Text(
                  note.title,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 24.0,
                    fontFamily: 'poppins',
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    note.subTitle,
                    style: TextStyle(
                      color:
                          const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                      fontSize: 16.0,
                    ),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    BlocProvider.of<NotesCubit>(context).deleteNote(note);
                    ShowSnackBar(context, 'Note Deleted Successfully',
                        const Color.fromARGB(255, 211, 14, 14), Icons.check);
                  },
                  icon: const Icon(
                    size: 30.0,
                    Icons.delete,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Text(
                  note.date.toString(),
                  style: const TextStyle(
                    color: Color.fromARGB(255, 14, 14, 14),
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
