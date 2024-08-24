import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:notiva/constants.dart';
import 'package:notiva/models/note_model.dart';
import 'package:notiva/widgets/notes_list_builder.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  static const String id = 'searchScreen';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<NoteModel> _searchResults = [];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _searchNotes(String query) {
    var box = Hive.box<NoteModel>('notes');
    var notes = box.values.toList();

    // using a delay before performing the search
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        _searchResults = notes.where((note) {
          final titleLower = note.title.toLowerCase();
          final contentLower = note.subTitle.toLowerCase();
          final searchLower = query.toLowerCase();

          return titleLower.contains(searchLower) ||
              contentLower.contains(searchLower);
        }).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Search Notes',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: kPrimaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: 'Search notes',
                hintStyle: TextStyle(color: Colors.white54),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                filled: true,
                fillColor: Colors.white10,
              ),
              onChanged: _searchNotes,
              cursorColor: Colors.white,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _searchResults.isEmpty
                  ? SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 100),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/not_Found.png',
                              height: 200,
                            ),
                            const Text(
                              'No notes found',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : NotesListBuilder(notes: _searchResults), // Use NotesListBuilder with search results
            ),
          ],
        ),
      ),
    );
  }
}
