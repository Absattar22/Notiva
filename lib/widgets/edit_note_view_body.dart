import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notiva/cubits/notes_cubit/notes_cubit.dart';
import 'package:notiva/models/note_model.dart';
import 'package:notiva/widgets/custom_app_bar.dart';
import 'package:notiva/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({
    super.key,
    required this.note,
  });

  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          const SizedBox(height: 10),
          CustomAppBar(
              title: 'Edit Notes',
              icon: Icons.check,
              onPressed: () {
                widget.note.title = title ?? widget.note.title;
                widget.note.subTitle = subTitle ?? widget.note.subTitle;
                widget.note.save();
                Navigator.pop(context);
                BlocProvider.of<NotesCubit>(context).fetchALlNotes();
              }),
          const SizedBox(height: 40),
          CustomTextField(
            onChanged: (val) {
              title = val;
            },
            hintText: widget.note.title,
            labelText: 'Enter Note Title',
          ),
          const SizedBox(height: 24),
          CustomTextField(
            onChanged: (val) {
              subTitle = val;
            },
            hintText: widget.note.subTitle,
            labelText: 'Enter Note Description',
            maxLines: 5,
          ),
        ],
      ),
    );
  }
}
