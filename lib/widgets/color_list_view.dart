import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notiva/constants.dart';
import 'package:notiva/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notiva/widgets/color_item.dart';

class ColorListView extends StatefulWidget {
  const ColorListView({
    super.key,
  });

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
  int selectedIndex = 0;
  
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
                    selectedIndex = index;
                    BlocProvider.of<AddNoteCubit>(context).color =
                        colors[index];
                    setState(() {});
                  },
                  child: ColorItem(
                      isSelected: selectedIndex == index,
                      color: colors[index])),
            );
          }),
    );
  }
}
