import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notiva/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notiva/models/note_model.dart';
import 'package:notiva/widgets/custom_button.dart';
import 'package:notiva/widgets/custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomTextField(
            onSaved: (value) => title = value,
            hintText: 'Title',
            labelText: 'Enter Note Title',
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Please Enter a title';
              } else if (value!.length >= 28) {
                return 'Title is too long';
              }
              return null;
            },
          ),
          const SizedBox(height: 24),
          CustomTextField(
            onSaved: (value) => subtitle = value,
            hintText: 'Description',
            labelText: 'Enter Note Description',
            maxLines: 5,
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Please Enter a description';
              }
              return null;
            },
          ),
          const SizedBox(height: 32),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteLoading ? true : false,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();

                    var currentDateTime = DateTime.now();

                    var formattedDate =
                        DateFormat.yMEd().format(currentDateTime);
                    var noteModel = NoteModel(
                        title: title!,
                        subTitle: subtitle!,
                        date: formattedDate,
                        color: const Color.fromARGB(255, 18, 113, 150).value);
                    BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              );
            },
          )
        ],
      ),
    );
  }
}
