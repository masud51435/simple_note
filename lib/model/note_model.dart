import 'package:cloud_firestore/cloud_firestore.dart';

class Note {
  String? id;
  String title;
  String description;
  DateTime createdAt;

  Note({
    this.id,
    required this.title,
    required this.description,
    required this.createdAt,
  });

  factory Note.fromDocument(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;

    return Note(
      id: doc.id,
      title: data['title'] ?? 'Untitled',
      description: data['description'] ?? '',
      createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'createdAt': createdAt,
    };
  }
}
