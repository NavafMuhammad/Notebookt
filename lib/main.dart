import 'package:flutter/material.dart';
import 'package:note_app/constant/const.dart';
import 'package:note_app/view/screen_all_notes/screen_all_notes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kScaffoldBackgroundColor,
      ),
      home: const ScreenAllNotes(),
    );
  }
}
