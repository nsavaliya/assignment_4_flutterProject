import 'package:flutter/material.dart';

class notes extends StatefulWidget {
  @override
  _notesState createState() => _notesState();
}

class _notesState extends State<notes> {
  List<String> _notes = [];//list the store notes

// Function to add a new note
  void _addNote() {
    showDialog(
      context: context,
      builder: (context) {
        String newNote = '';// Initialize new note
        return AlertDialog(
          title: Text('Add Note'),
          content: TextField(
            onChanged: (value) {
              newNote = value;// Update newNote when text changes
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);// Close the dialog
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _notes.add(newNote);// Add new note to the list
                });
                Navigator.pop(context);// Close the dialog
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
        String updatedNote = _notes[index];// Initialize updated note
        return AlertDialog(
          title: Text('Edit Note'),
          content: TextField(
            onChanged: (value) {
              updatedNote = value;// Update updatedNote when text changes
            },
            controller: TextEditingController(text: _notes[index]),// Set initial text in the text field
          ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);// Close the dialog
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _notes[index] = updatedNote;// Update note in the list
                });
                Navigator.pop(context); // Close the dialog
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
      _notes.removeAt(index);// Remove note from the list
    });
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
            onDismissed: (_) => _deleteNote(index),// Call delete function when note is dismissed
            child: ListTile(
              onTap: () => _editNote(index),// Call edit function when note is tapped
              title: Text(_notes[index]),// Display note text
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNote,// Call add function when button is pressed
        child: Icon(Icons.add),
      ),
    );
  }
}