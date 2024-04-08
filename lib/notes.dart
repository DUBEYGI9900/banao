import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyDSfQiqCOvjidfe1t4iDbpA_nXJiIJtEbk',
    appId: '1:494565097196:android:e11d757a85b92d9f6cafc9',
    messagingSenderId: 'G-BRNGNZNJH4',
    projectId: 'banao-ca7e2',
    storageBucket: 'gs://banao-ca7e2.appspot.com',
    databaseURL: 'https://banao-ca7e2-default-rtdb.firebaseio.com',
  ));
  runApp(MyApps());
}

class MyApps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Note App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: NoteListScreen(),
    );
  }
}

class NoteListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNoteScreen()),
          );
          if (result != null) {
            await addNoteToFirestore(result);
          }
        },
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder(
        stream: getNotesFromFirestore(),
        builder: (context, AsyncSnapshot<List<Note>> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final notes = snapshot.data!;

          return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 4,
                      )
                    ],
                    border: Border.all(
                      color: Colors.black.withOpacity(0.1),
                      width: 1,
                    ),
                  ),
                  child: ListTile(
                    title: Text(notes[index].title),
                    subtitle: Text(notes[index].description),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () async {
                            final result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    EditNoteScreen(note: notes[index]),
                              ),
                            );
                            if (result != null) {
                              await updateNoteInFirestore(result);
                            }
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () async {
                            await deleteNoteFromFirestore(notes[index].id);
                          },
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              NoteDetailsScreen(note: notes[index]),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class Note {
  final String id;
  final String title;
  final String description;

  Note({required this.id, required this.title, required this.description});
}

class AddNoteScreen extends StatefulWidget {
  @override
  _AddNoteScreenState createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title',
               border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      color: Colors.black,
                      //  color: Colors.black.withOpacity(0.1),
                      width: 1,
                    ),
                  ),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
                 border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      color: Colors.black,
                      //  color: Colors.black.withOpacity(0.1),
                      width: 1,
                    ),
                  ),
              ),
              maxLines: 2,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final newNote = Note(
                  id: '',
                  title: _titleController.text,
                  description: _descriptionController.text,
                );
                Navigator.pop(context, newNote);
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

class EditNoteScreen extends StatefulWidget {
  final Note note;

  EditNoteScreen({required this.note});

  @override
  _EditNoteScreenState createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.note.title);
    _descriptionController =
        TextEditingController(text: widget.note.description);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title',
               border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      color: Colors.black,
                      //  color: Colors.black.withOpacity(0.1),
                      width: 1,
                    ),
                  ),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      color: Colors.black,
                      //  color: Colors.black.withOpacity(0.1),
                      width: 1,
                    ),
                  )),
              maxLines: 2,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final editedNote = Note(
                  id: widget.note.id,
                  title: _titleController.text,
                  description: _descriptionController.text,
                );
                Navigator.pop(context, editedNote);
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

class NoteDetailsScreen extends StatelessWidget {
  final Note note;

  NoteDetailsScreen({required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(note.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(note.title), Text(note.description)],
        ),
      ),
    );
  }
}

// Firebase Firestore CRUD operations

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

Future<void> addNoteToFirestore(Note note) async {
  try {
    await _firestore.collection('notes').add({
      'title': note.title,
      'description': note.description,
    });
  } catch (e) {
    print('Error adding note: $e');
  }
}

Future<void> updateNoteInFirestore(Note note) async {
  try {
    await _firestore.collection('notes').doc(note.id).update({
      'title': note.title,
      'description': note.description,
    });
  } catch (e) {
    print('Error updating note: $e');
  }
}

Future<void> deleteNoteFromFirestore(String noteId) async {
  try {
    await _firestore.collection('notes').doc(noteId).delete();
  } catch (e) {
    print('Error deleting note: $e');
  }
}

Stream<List<Note>> getNotesFromFirestore() {
  return _firestore.collection('notes').snapshots().map((snapshot) {
    return snapshot.docs.map((doc) {
      return Note(
        id: doc.id,
        title: doc['title'],
        description: doc['description'],
      );
    }).toList();
  });
}
