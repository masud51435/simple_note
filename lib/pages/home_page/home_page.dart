import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:notes/controllers/note_controller.dart';
import 'package:notes/core/app_colors.dart';
import 'package:notes/pages/home_page/widgets/note_detail.dart';

import 'widgets/home_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final NoteController controller = Get.put(NoteController());
    return Scaffold(
      appBar: HomeAppBar(controller: controller),
      body: Obx(
        () {
          if (controller.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(
                color: blackColor,
              ),
            );
          }

          if (controller.filterNoteList.isEmpty) {
            return Center(
              child: Text(
                'Add Note',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: greyColor,
                ),
              ),
            );
          }

          return GridView.builder(
            padding: const EdgeInsets.all(20),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 0.96,
            ),
            itemCount: controller.filterNoteList.length,
            itemBuilder: (context, index) {
              final note = controller.filterNoteList[index];
              final formattedDate =
                  DateFormat('dd MMMM yyyy').format(note.createdAt);
              return InkWell(
                onTap: () => Get.to(() => NoteDetailPage(note: note)),
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: greyColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        note.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 19,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        note.description,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: blackColor.withOpacity(0.9),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        formattedDate,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: blackColor.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: Colors.amberAccent.shade400,
        onPressed: () => Get.toNamed('/addNote'),
        child: Icon(
          Icons.add,
          size: 35,
          color: whiteColor,
        ),
      ),
    );
  }
}
