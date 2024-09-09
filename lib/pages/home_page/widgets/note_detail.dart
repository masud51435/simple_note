import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'; // For date formatting
import 'package:notes/model/note_model.dart';

import '../../../controllers/note_controller.dart';

class NoteDetailPage extends StatelessWidget {
  final Note note;
  final NoteController notesController = NoteController.instance;

  NoteDetailPage({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    final formattedDate =
        DateFormat('dd MMMM yyyy').format(note.createdAt); 

    return Scaffold(
      appBar: AppBar(
        title: const Text('Note Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              notesController.deleteNote(note);
              Get.back(); // Go back to the homepage after deletion
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              note.description,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            Text(
              'Created on: $formattedDate', // Show the full creation date
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                showUpdateNoteDialog(context);
              },
              child: const Text('Edit Note'),
            ),
          ],
        ),
      ),
    );
  }

  void showUpdateNoteDialog(BuildContext context) {
    notesController.titleController.text = note.title;
    notesController.descriptionController.text = note.description;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Update Note'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: notesController.titleController,
                decoration: const InputDecoration(hintText: 'Title'),
              ),
              TextField(
                controller: notesController.descriptionController,
                decoration: const InputDecoration(hintText: 'Description'),
                maxLines: 3,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final updatedNote = Note(
                  id: note.id,
                  title: notesController.titleController.text,
                  description: notesController.descriptionController.text,
                  createdAt: note.createdAt, // Keep the original creation date
                );

                notesController.updateNote(updatedNote);
                Get.back();
              },
              child: const Text('Update'),
            ),
          ],
        );
      },
    );
  }
}
