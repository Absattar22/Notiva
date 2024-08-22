import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notiva/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial()) {
    fetchALlNotes();
  }

  List<NoteModel>? notes;
  fetchALlNotes() {
    var notesBox = Hive.box<NoteModel>('notes');
    notes = notesBox.values.toList();
    emit(NotesSuccess());
  }

  void deleteNote(NoteModel note) {
    note.delete(); // Delete the note from the Hive box
    fetchALlNotes(); // Re-fetch notes to update the list
  }
}
