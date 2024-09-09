import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/common/common_button.dart';
import 'package:notes/controllers/note_controller.dart';
import 'package:notes/pages/ultils/Uitilities.dart';

class AddNotePage extends StatelessWidget {
  const AddNotePage({super.key}); // Fetch the NotesController

  @override
  Widget build(BuildContext context) {
    final NoteController notesController = NoteController.instance;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // TextField for the Title
            TextField(
              controller: notesController.titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16), // Spacing between Title and Description

            // TextField for the Description
            TextField(
              controller: notesController.descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
              maxLines: 5, // Allow up to 5 lines of description
            ),
            const SizedBox(height: 20),
            // Save Button
            CommonButton(
              onTap: () {
                // Check if title or description is empty
                if (notesController.titleController.text.isEmpty ||
                    notesController.descriptionController.text.isEmpty) {
                  Utils().toastMessage('Please fill in all fields');
                } else {
                  notesController.addNote();
                  Get.back();
                  Utils().toastMessage('Note added successfully');
                }
              },
              text: 'Save Note',
            ),
          ],
        ),
      ),
    );
  }
}
