import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:note_app/data/get_all_notes_resp_model/get_all_notes_resp_model.dart';
import 'package:note_app/data/note_model/note_model.dart';
import 'package:note_app/data/url.dart';

abstract class ApiCalls {
  Future<NoteModel?> createNote(NoteModel value);
  Future<List<NoteModel>> getAllNotes();
  Future<NoteModel?> updateNote(NoteModel value);
  Future<void> deleteNote(String noteID);
}

class NoteDB extends ApiCalls {
  NoteDB._internal() {
    dio.options = BaseOptions(
      baseUrl: url.baseUrl,
      responseType: ResponseType.plain,
    );
  }

  static NoteDB instance = NoteDB._internal();

  factory NoteDB() {
    return instance;
  }

  final dio = Dio();
  final url = Url();

  ValueNotifier<List<NoteModel>> noteListNotifier = ValueNotifier([]);

  @override
  Future<NoteModel?> createNote(value) async {
    try {
      final result = await dio.post(
        url.createNote,
        data: value.toJson(),
      );

      final resultAsJson = await json.decode(result.data);
      final noteModelResp = NoteModel.fromJson(resultAsJson);

      return noteModelResp;
    } on DioException catch (e) {
      return null;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> deleteNote(noteID) async {
    final result =
        await dio.delete(url.deleteNote.replaceFirst('{id}', noteID));
    if (result.data == null) {
      return;
    }
    //find index
    final index = noteListNotifier.value.indexWhere(
      (element) => element.id == noteID,
    );
    if (index == -1) {
      return;
    }
    noteListNotifier.value.removeAt(index);
    refreshUI();
  }

  @override
  Future<List<NoteModel>> getAllNotes() async {
    final result = await dio.get(url.getAllNote);
    if (result.data != null) {
      final resultAsJson = await jsonDecode(result.data);
      return GetAllNotesRespModel.fromJson(resultAsJson).data;
    } else {
      noteListNotifier.value.clear();
      return [];
    }
  }

  @override
  Future<NoteModel?> updateNote(value) async {
    final result = await dio.put(url.updateNote, data: value.toJson());
    if (result.data == null) {
      return null;
    }
    // find index
    final index = noteListNotifier.value.indexWhere(
      (element) => element.id == value.id,
    );
    // remove from index
    noteListNotifier.value.removeAt(index);
    // insert to that index
    noteListNotifier.value.add(value);
    return value;
  }

  Future<void> refreshUI() async {
    final list = await getAllNotes();
    noteListNotifier.value.clear();
    noteListNotifier.value.addAll(list.reversed);
    noteListNotifier.notifyListeners();
  }

  NoteModel? getNoteById(String id) {
    try {
      return noteListNotifier.value.firstWhere((note) => note.id == id);
    } catch (_) {
      return null;
    }
  }
}
