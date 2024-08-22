import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notiva/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  getNotes() async {
    try {
      var notesBox = await Hive.openBox<NoteModel>('notes');

      emit(NotesSuccess(notesBox.values.toList()));
    } catch (e) {
      emit(NotesFailure(e.toString()));
    }
  }
}
