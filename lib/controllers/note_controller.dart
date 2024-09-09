import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/pages/ultils/Uitilities.dart';

import '../model/note_model.dart';

class NoteController extends GetxController {
  static NoteController get instance => Get.find();

  var noteList = <Note>[].obs;
  var filterNoteList = <Note>[].obs;
  var isLoading = true.obs;

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final searchController = TextEditingController();

  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchNotes();
    searchController.addListener(() {
      searchNotes(searchController.text);
    });
  }

  Future<void> fetchNotes() async {
    isLoading.value = true;
    try {
      var snapshot = await fireStore.collection('notes').get();
      noteList.value =
          snapshot.docs.map((doc) => Note.fromDocument(doc)).toList();
      filterNoteList.value = noteList;
    } catch (e) {
      Utils().toastMessage(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void addNote() {
    final note = Note(
      title: titleController.text,
      description: descriptionController.text,
      createdAt: DateTime.now(),
    );
    titleController.clear();
    descriptionController.clear();
    fireStore.collection('notes').add(note.toJson());
    fetchNotes();
  }

  void updateNote(Note note) {
    fireStore.collection('notes').doc(note.id).update({
      'title': note.title,
      'description': note.description,
    }).then((value) {
      fetchNotes();
      Utils().toastMessage('Note updated successfully');
    }).catchError((error) {
      Utils().toastMessage('Failed to update note: $error');
    });
  }

  void deleteNote(Note note) {
    fireStore.collection('notes').doc(note.id).delete().then((value) {
      fetchNotes();
      Utils().toastMessage('Note Delete successfully');
    }).catchError((error) {
      Utils().toastMessage('Failed to Delete note: $error');
    });
  }

  void searchNotes(String query) {
    if (query.isEmpty) {
      filterNoteList.value = noteList;
    } else {
      filterNoteList.value = noteList
          .where(
              (note) => note.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}
