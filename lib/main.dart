import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notiva/cubits/notes_cubit/notes_cubit.dart';
import 'package:notiva/models/note_model.dart';
import 'package:notiva/simple_bloc_observer.dart';
import 'package:notiva/views/notes_screen.dart';
import 'package:notiva/views/onboarding_screen.dart';
import 'package:notiva/views/search_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final bool onboarding = prefs.getBool('onboarding') ?? false;

  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>('notes');
  runApp(Notiva(onboarding: onboarding));
}

class Notiva extends StatelessWidget {
  final bool onboarding;
  const Notiva({super.key, this.onboarding = false});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          NotesScreen.id: (context) => const NotesScreen(),
          OnBoardingScreen.id: (context) => OnBoardingScreen(),
          SearchScreen.id: (context) => const SearchScreen(),
        },
        initialRoute: onboarding ? NotesScreen.id : OnBoardingScreen.id,
      ),
    );
  }
}
