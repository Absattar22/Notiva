import 'package:flutter/material.dart';
import 'package:notiva/constants.dart';
import 'package:notiva/views/search_screen.dart';
import 'package:notiva/widgets/custom_app_bar.dart';
import 'package:notiva/widgets/notes_list_builder.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            CustomAppBar(title: 'Notes' , icon: Icons.search , onPressed: (){
              Navigator.pushNamed(context, SearchScreen.id);
            }),
            const Expanded(child: NotesListBuilder()),
          ],
        ),
      ),
    );
  }
}
