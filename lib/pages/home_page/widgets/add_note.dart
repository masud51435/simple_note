import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/common/common_button.dart';
import 'package:notes/common/custom_appbar.dart';
import 'package:notes/controllers/note_controller.dart';
import 'package:notes/pages/ultils/Uitilities.dart';

class AddNotePage extends StatelessWidget {
  const AddNotePage({super.key}); // Fetch the NotesController

  @override
  Widget build(BuildContext context) {
    final NoteController addNotesController = NoteController.instance;
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Add Note',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // TextField for the Title
            TextFormField(
              controller: addNotesController.titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // TextField for the Description
            TextFormField(
              controller: addNotesController.descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
              maxLines: 5,
            ),
            const SizedBox(height: 20),
            // Save Button
            CommonButton(
              onTap: () {
                // Check if title or description is empty
                if (addNotesController.titleController.text.isEmpty ||
                    addNotesController.descriptionController.text.isEmpty) {
                  Utils().toastMessage('Please fill in all fields');
                } else {
                  addNotesController.addNote();
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
