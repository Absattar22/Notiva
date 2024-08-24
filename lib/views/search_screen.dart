import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:notiva/constants.dart';
import 'package:notiva/models/note_model.dart'; // Ensure this points to your Note model
import 'package:notiva/views/edit_note_screen.dart'; // Import the new EditNoteScreen

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
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
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
                  : ListView.builder(
                      itemCount: _searchResults.length,
                      itemBuilder: (context, index) {
                        int reversedIndex = _searchResults.length - index - 1;
                        final note = _searchResults[reversedIndex];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Card(
                            color: Colors.white.withOpacity(0.1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: ListTile(
                              contentPadding: const EdgeInsets.all(16),
                              title: Text(
                                note.title,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    note.subTitle,
                                    style: const TextStyle(
                                        color: Colors.white70, fontSize: 16),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    note.date,
                                    style: const TextStyle(
                                        color: Colors.white54, fontSize: 14),
                                  ),
                                ],
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        EditNoteScreen(note: note),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
