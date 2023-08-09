import 'package:flutter/material.dart';

class notes extends StatefulWidget {
  @override
  _notesState createState() => _notesState();
}

class _notesState extends State<notes> {
  List<String> _notes = [];

  void _addNote() {
    showDialog(
      context: context,
      builder: (context) {
        String newNote = '';
        return AlertDialog(
          title: Text('Add Note'),
          content: TextField(
            onChanged: (value) {
              newNote = value;
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _notes.add(newNote);
                });
                Navigator.pop(context);
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _editNote(int index) {
    showDialog(
      context: context,
      builder: (context) {
        String updatedNote = _notes[index];
        return AlertDialog(
          title: Text('Edit Note'),
          content: TextField(
            onChanged: (value) {
              updatedNote = value;
            },
            controller: TextEditingController(text: _notes[index]),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _notes[index] = updatedNote;
                });
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _deleteNote(int index) {
    setState(() {
      _notes.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notes')),
      body: ListView.builder(
        itemCount: _notes.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: UniqueKey(),
            onDismissed: (_) => _deleteNote(index),
            child: ListTile(
              onTap: () => _editNote(index),
              title: Text(_notes[index]),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNote,
        child: Icon(Icons.add),
      ),
    );
  }
}