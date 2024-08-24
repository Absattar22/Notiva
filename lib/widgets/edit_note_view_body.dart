import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notiva/cubits/notes_cubit/notes_cubit.dart';
import 'package:notiva/helper/snack_bar.dart';
import 'package:notiva/models/note_model.dart';
import 'package:notiva/widgets/custom_app_bar.dart';
import 'package:notiva/widgets/custom_text_field.dart';
import 'package:notiva/widgets/edit_notes_color_list.dart';

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
  late TextEditingController _titleController;
  late TextEditingController _subTitleController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.note.title);
    _subTitleController = TextEditingController(text: widget.note.subTitle);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _subTitleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            CustomAppBar(
              title: 'Edit Notes',
              icon: Icons.check,
              onPressed: () {
                widget.note.title = _titleController.text;
                widget.note.subTitle = _subTitleController.text;
                widget.note.save();
                Navigator.pop(context);
                BlocProvider.of<NotesCubit>(context).fetchALlNotes();
                ShowSnackBar(
                  context,
                  'Note Updated Successfully',
                  const Color.fromARGB(255, 30, 117, 193),
                  Icons.check,
                );
              },
            ),
            const SizedBox(height: 40),
            CustomTextField(
              controller: _titleController,
              hintText: 'Enter Note Title',
              labelText: 'Enter Note Title',
            ),
            const SizedBox(height: 24),
            CustomTextField(
              controller: _subTitleController,
              hintText: 'Enter Note Description',
              labelText: 'Enter Note Description',
              maxLines: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 36),
              child: EditNotesColorList(
                note: widget.note,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
