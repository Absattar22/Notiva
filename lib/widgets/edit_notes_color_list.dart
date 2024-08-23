import 'package:flutter/material.dart';
import 'package:notiva/constants.dart';
import 'package:notiva/models/note_model.dart';
import 'package:notiva/widgets/color_item.dart';

class EditNotesColorList extends StatefulWidget {
  const EditNotesColorList({super.key, required this.note});

  final NoteModel note;
  @override
  State<EditNotesColorList> createState() => _EditNotesColorListState();
}

class _EditNotesColorListState extends State<EditNotesColorList> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex =
        colors.indexWhere((element) => element.value == widget.note.color);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: colors.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                      widget.note.color = colors[index].value;
                    });
                  },
                  child: ColorItem(
                      isSelected: selectedIndex == index,
                      color: colors[index])),
            );
          }),
    );
  }
}
